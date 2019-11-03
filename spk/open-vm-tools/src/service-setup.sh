
# Package specific behaviors
# Sourced script by generic installer and start-stop-status scripts
# PACKAGE="open-vm-tools"
VMTOOLS_DIR="/usr/local/${SYNOPKG_PKGNAME}"
VMTOOLS_DAEMON="${VMTOOLS_DIR}/bin/vmtoolsd"
CONF_FILE=/etc/vmware-tools/tools.conf

# TMP_DIR="${SYNOPKG_PKGDEST}/../../@tmp"

PATH="${VMTOOLS_DIR}/bin:${PATH}"
# export PATH=${PATH}:${SYNOPKG_PKGDEST}/bin:${SYNOPKG_PKGDEST}/sbin:${SYNOPKG_PKGDEST}/usr/bin
# export LD_LIBRARY_PATH=${LD_LIBRARY_PATH:+${LD_LIBRARY_PATH}:}${SYNOPKG_PKGDEST}/lib
# LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${SYNOPKG_PKGDEST}/lib/open-vm-tools/plugins/vmsvc
# LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${SYNOPKG_PKGDEST}/lib/open-vm-tools/plugins/common

SERVICE_COMMAND="${VMTOOLS_DAEMON} -b ${PID_FILE} -c ${CONF_FILE}"
# SVC_CWD="${SYNOPKG_PKGDEST}"
# SVC_BACKGROUND=y
# SVC_WRITE_PID=y

# These functions are for demonstration purpose of DSM sequence call.
# Only provide useful ones for your own package, logging may be removed.
service_postinst ()
{
    # Symlink
    ln -s ${SYNOPKG_PKGDEST} ${VMTOOLS_DIR}

    # create some /var directory - just for us...
    # mkdir ${VMTOOLS_DIR}/var

    # create link for etc and lib
    [ -e /etc/vmware-tools ] || ln -s ${SYNOPKG_PKGDEST}/etc/vmware-tools /etc/vmware-tools
    [ -e /lib/open-vm-tools ] || ln -s ${SYNOPKG_PKGDEST}/lib/open-vm-tools /lib/open-vm-tools
    if [ ! -e /lib/udev/rules.d/99-vmware-scsi-udev.rules ]; then
        ln -s ${SYNOPKG_PKGDEST}/lib/udev/rules.d/99-vmware-scsi-udev.rules /lib/udev/rules.d/99-vmware-scsi-udev.rules
        udevadm control --reload
    fi

    cat > ${CONF_FILE} << EOF
bindir = "${SYNOPKG_PKGDEST}/bin"	
libdir = "${SYNOPKG_PKGDEST}/lib"
EOF

    echo "service_postinst ${SYNOPKG_PKG_STATUS}" >> $INST_LOG
}

service_preuninst ()
{
    # Stop the package
    # ${SSS} stop > /dev/null

    echo "service_preuninst ${SYNOPKG_PKG_STATUS}" >> $INST_LOG
}

service_postuninst ()
{
    # Remove link
    rm -f ${VMTOOLS_DIR}

    # Remove link for etc and lib
    [ -L /etc/vmware-tools ] && rm -f /etc/vmware-tools
    [ -L /lib/open-vm-tools ] && rm -f /lib/open-vm-tools
    if [ -L /lib/udev/rules.d/99-vmware-scsi-udev.rules ]; then
        rm -f /lib/udev/rules.d/99-vmware-scsi-udev.rules
        udevadm control --reload
    fi
    echo "service_postuninst ${SYNOPKG_PKG_STATUS}" >> $INST_LOG
}

service_preupgrade ()
{
    # Stop the package
    # ${SSS} stop > /dev/null

    # Save some stuff
    # rm -fr ${TMP_DIR}/${PACKAGE}
    # mkdir -p ${TMP_DIR}/${PACKAGE}
    # mv ${VMTOOLS_DIR}/var ${TMP_DIR}/${PACKAGE}/

    echo "service_preupgrade ${SYNOPKG_PKG_STATUS}" >> $INST_LOG
}

service_postupgrade ()
{
    # Restore some stuff
    # rm -fr ${VMTOOLS_DIR}/var
    # mv ${TMP_DIR}/${PACKAGE}/var ${VMTOOLS_DIR}/
    # rm -fr ${TMP_DIR}/${PACKAGE}

    echo "service_postupgrade ${SYNOPKG_PKG_STATUS}" >> $INST_LOG
}

service_poststop ()
{
    echo "After stop" >> $LOG_FILE
}

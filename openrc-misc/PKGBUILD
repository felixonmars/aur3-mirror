# Maintainer: artoo <artoo@manjaro.org>

# file vars for easy update
_Ifrcon=fcron.init.3
_Crsysl=rsyslog.confd
_Irsysl=rsyslog.initd
_Csane=saned.confd
_Isane=saned.initd
_Ifuse=fuse.init
_Cmeta=metalog.confd
_Imeta=metalog.initd
_Csyslog=syslog-ng.confd
_Isyslog=syslog-ng.rc6
_Clirc1=lircd.conf.4
_Clirc2=irexec-confd
_Ilirc1=lircd-0.8.6-r2
_Ilirc2=irexec-initd-0.8.6-r2
_Ilirc3=lircmd
#_Csens=sensord-conf.d
_Isens1=sensord-4-init.d
_Isens2=fancontrol-init.d-2
_Isens3=lm_sensors-3-init.d
_Ccpu=conf.d-r2
_Icpu=init.d-r4
_Cntp1=ntpd.confd
_Cntp2=ntp-client.confd
_Cntp3=sntp.confd
_Intp1=ntpd.rc-r1
_Intp2=ntp-client.rc
_Intp3=sntp.rc
_Icups=cupsd.init.d-r1
_Ccon=connman.confd
_Icon=connman.initd2
_Chaveg=haveged-conf.d
_Ihaveg=haveged-init.d.3
_Csalt_mtr=master-confd-1
_Isalt_mtr=master-initd-3
_Csalt_min=minion-confd-1
_Isalt_min=minion-initd-3
_Csalt_sync=syndic-confd-1
_Isalt_sync=syndic-initd-3
_Impd=mpd2.init
_Chdparm=hdparm-conf.d.3
_Ihdparm=hdparm-init-8
_Cbit=bitlbee.confd
_Ibit=bitlbee.initd
_Itherm=thermald.initd
_Ixe=xe-daemon.initd
_Ivbox=virtualbox-guest-additions-8.initd
_Izfs=zfs.initd
_IClam=clamd.initd-r6
_CClam=clamd.conf-r1
_CNM=conf.d.NetworkManager
_INM=init.d.NetworkManager
_SNM=10-openrc-status-r4

_gentoo_uri="http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86"

pkgbase=openrc-misc
pkgname=('cpupower-openrc'
	'connman-openrc'
	'fcron-openrc'
	'fuse-openrc'
	'metalog-openrc'
	'rsyslog-openrc'
	'sane-openrc'
	'syslog-ng-openrc'
	'lirc-utils-openrc'
	'lm_sensors-openrc'
	'ntp-openrc'
	'cups-openrc'
	'haveged-openrc'
	'salt-openrc'
	'mpd-openrc'
	'hdparm-openrc'
	'bitlbee-openrc'
	'thermald-openrc'
	'xe-guest-utilities-openrc'
	'virtualbox-guest-utils-openrc'
	'zfs-openrc'
	'clamav-openrc'
	'networkmanager-openrc')
pkgver=20150119
pkgrel=1
pkgdesc="OpenRC init scripts"
arch=('any')
url="https://github.com/manjaro/packages-openrc"
license=('GPL2')
groups=('openrc' 'openrc-misc')
conflicts=('openrc'
	'openrc-git'
	'openrc-arch-services-git'
	'initscripts'
	'systemd-sysvcompat')
source=("${_gentoo_uri}/sys-process/fcron/files/${_Ifrcon}"
	"${_gentoo_uri}/app-admin/rsyslog/files/8-stable/${_Crsysl}"
	"${_gentoo_uri}/app-admin/rsyslog/files/8-stable/${_Irsysl}"
	"${_gentoo_uri}/media-gfx/sane-backends/files/${_Csane}"
	"${_gentoo_uri}/media-gfx/sane-backends/files/${_Isane}"
	"${_gentoo_uri}/sys-fs/fuse/files/${_Ifuse}"
	"${_gentoo_uri}/app-admin/metalog/files/${_Cmeta}"
	"${_gentoo_uri}/app-admin/metalog/files/${_Imeta}"
	"${_gentoo_uri}/app-admin/syslog-ng/files/3.6/${_Csyslog}"
	"${_gentoo_uri}/app-admin/syslog-ng/files/3.6/${_Isyslog}"
	"${_gentoo_uri}/app-misc/lirc/files/${_Clirc1}"
	"${_gentoo_uri}/app-misc/lirc/files/${_Clirc2}"
	"${_gentoo_uri}/app-misc/lirc/files/${_Ilirc1}"
	"${_gentoo_uri}/app-misc/lirc/files/${_Ilirc2}"
	"${_gentoo_uri}/app-misc/lirc/files/${_Ilirc3}"
	"${_gentoo_uri}/sys-power/cpupower/files/${_Ccpu}"
	"${_gentoo_uri}/sys-power/cpupower/files/${_Icpu}"
	#"${_gentoo_uri}/sys-apps/lm_sensors/files/${_Csens}"
	"${_gentoo_uri}/sys-apps/lm_sensors/files/${_Isens1}"
	"${_gentoo_uri}/sys-apps/lm_sensors/files/${_Isens2}"
	"${_gentoo_uri}/sys-apps/lm_sensors/files/${_Isens3}"
	"${_gentoo_uri}/net-misc/ntp/files/${_Cntp1}"
	"${_gentoo_uri}/net-misc/ntp/files/${_Cntp2}"
	"${_gentoo_uri}/net-misc/ntp/files/${_Cntp3}"
	"${_gentoo_uri}/net-misc/ntp/files/${_Intp1}"
	"${_gentoo_uri}/net-misc/ntp/files/${_Intp2}"
	"${_gentoo_uri}/net-misc/ntp/files/${_Intp3}"
	"${_gentoo_uri}/net-print/cups/files/${_Icups}"
	"${_gentoo_uri}/net-misc/connman/files/${_Ccon}"
	"${_gentoo_uri}/net-misc/connman/files/${_Icon}"
	"${_gentoo_uri}/sys-apps/haveged/files/${_Chaveg}"
	"${_gentoo_uri}/sys-apps/haveged/files/${_Ihaveg}"
	"${_gentoo_uri}/app-admin/salt/files/${_Csalt_mtr}"
	"${_gentoo_uri}/app-admin/salt/files/${_Isalt_mtr}"
	"${_gentoo_uri}/app-admin/salt/files/${_Csalt_min}"
	"${_gentoo_uri}/app-admin/salt/files/${_Isalt_min}"
	"${_gentoo_uri}/app-admin/salt/files/${_Csalt_sync}"
	"${_gentoo_uri}/app-admin/salt/files/${_Isalt_sync}"
	"${_gentoo_uri}/media-sound/mpd/files/${_Impd}"
	"${_gentoo_uri}/sys-apps/hdparm/files/${_Chdparm}"
	"${_gentoo_uri}/sys-apps/hdparm/files/${_Ihdparm}"
	"${_gentoo_uri}/net-im/bitlbee/files/${_Cbit}"
	"${_gentoo_uri}/net-im/bitlbee/files/${_Ibit}"
	"${_gentoo_uri}/app-emulation/xe-guest-utilities/files/${_Ixe}"
	"${_gentoo_uri}/app-emulation/virtualbox-guest-additions/files/${_Ivbox}"
	"${_Izfs}"
	"${_Itherm}"
	"${_gentoo_uri}/app-antivirus/clamav/files/${_CClam}"
	"${_gentoo_uri}/app-antivirus/clamav/files/${_IClam}"
	"${_gentoo_uri}/net-misc/networkmanager/files/${_CNM}"
        "${_gentoo_uri}/net-misc/networkmanager/files/${_INM}"
        "${_gentoo_uri}/net-misc/networkmanager/files/${_SNM}")

pkgver() {
    date +%Y%m%d
}

_shebang='s|#!/sbin/runscript|#!/usr/bin/openrc-run|'
_runpath='s|/var/run|/run|g'
_binpath='s|/usr/sbin|/usr/bin|g'


package_bitlbee-openrc() {
    pkgdesc="OpenRC bitlbee init script"
    depends=('openrc-core' 'bitlbee')
    backup=('etc/conf.d/bitlbee')
    install=bitlbee.install

    install -Dm755 "${srcdir}/${_Cbit}" "${pkgdir}/etc/conf.d/bitlbee"
    install -Dm755 "${srcdir}/${_Ibit}" "${pkgdir}/etc/init.d/bitlbee"
	  local _p1='s|need logger net|need net\n	use logger|'
    sed -e "${_shebang}" -e "${_binpath}" -e "${_runpath}" -e "${_p1}" -e "${_p2}" -i "${pkgdir}/etc/init.d/bitlbee"
}

package_cpupower-openrc() {
    pkgdesc="OpenRC cpupower init script"
    depends=('openrc-core' 'cpupower')
    backup=('etc/conf.d/cpupower')
    install=cpupower.install

    install -Dm755 "${srcdir}/${_Ccpu}" "${pkgdir}/etc/conf.d/cpupower"
    install -Dm755 "${srcdir}/${_Icpu}" "${pkgdir}/etc/init.d/cpupower"

    sed -e "${_shebang}" -i "${pkgdir}/etc/init.d/cpupower"
}

package_connman-openrc() {
    pkgdesc="OpenRC connman init script"
    depends=('openrc-core' 'connman')
    backup=('etc/conf.d/connman')
    install=connman.install

    install -Dm755 "${srcdir}/${_Ccon}" "${pkgdir}/etc/conf.d/connman"
    install -Dm755 "${srcdir}/${_Icon}" "${pkgdir}/etc/init.d/connman"

    sed -e "${_shebang}" -e "${_binpath}" -i "${pkgdir}/etc/init.d/connman"
}

package_cups-openrc() {
    pkgdesc="OpenRC cups init script"
    depends=('cups' 'dbus-openrc')
    optdepends=('avahi-openrc: avahi initscripts')
    install=cups.install

    install -Dm755 "${srcdir}/${_Icups}" "${pkgdir}/etc/init.d/cupsd"

    local _p1='s|lp:lpadmin|daemon:sys|' \
	  _p2='s|@neededservices@|need dbus avahi-daemon|'
    sed -e "${_shebang}" -e "${_binpath}" -e "${_p1}" -e "${_p2}" -i "${pkgdir}/etc/init.d/cupsd"
}

package_fcron-openrc() {
    pkgdesc="OpenRC fcron init script"
    depends=('openrc-core' 'fcron')
    groups=('openrc-misc')
    provides=('openrc-cron')
    conflicts=('cronie'
	      'cronie-openrc'
	      'openrc'
	      'openrc-git'
	      'openrc-arch-services-git'
	      'initscripts'
	      'systemd-sysvcompat')
    install=fcron.install

    install -Dm755 "${srcdir}/${_Ifrcon}" "${pkgdir}/etc/init.d/fcron"

    local _p1='s|/usr/libexec|/usr/bin|g'
    sed -e "${_shebang}" -e "${_runpath}" -e "${_p1}" -i "${pkgdir}/etc/init.d/fcron"
}

package_ntp-openrc() {
    pkgdesc="OpenRC ntp init script"
    depends=('openrc-core' 'ntp')
    optdepends=('bind-openrc: bind initscript')
    provides=('openrc-timed')
    conflicts=('openntpd'
	      'openntpd-openrc'
	      'openrc'
	      'openrc-git'
	      'openrc-arch-services-git'
	      'initscripts'
	      'systemd-sysvcompat')
    backup=('etc/conf.d/ntpd'
	    'etc/conf.d/ntp-client'
	    'etc/init.d/sntp')
    install=ntp.install

    install -Dm755 "${srcdir}/${_Cntp1}" "${pkgdir}/etc/conf.d/ntpd"
    install -Dm755 "${srcdir}/${_Intp1}" "${pkgdir}/etc/init.d/ntpd"
    install -Dm755 "${srcdir}/${_Cntp2}" "${pkgdir}/etc/conf.d/ntp-client"
    install -Dm755 "${srcdir}/${_Intp2}" "${pkgdir}/etc/init.d/ntp-client"
    install -Dm755 "${srcdir}/${_Cntp3}" "${pkgdir}/etc/conf.d/sntp"
    install -Dm755 "${srcdir}/${_Intp3}" "${pkgdir}/etc/init.d/sntp"

    for f in ${pkgdir}/etc/init.d/*;do
      sed -e "${_shebang}" -e "${_binpath}" -e "${_runpath}" -i $f
    done
}

package_rsyslog-openrc() {
    pkgdesc="OpenRC rsyslog init script"
    depends=('openrc-core' 'rsyslog')
    backup=('etc/conf.d/rsyslog')
    install=rsyslog.install

    install -Dm755 "${srcdir}/${_Crsysl}" "${pkgdir}/etc/conf.d/rsyslog"
    install -Dm755 "${srcdir}/${_Irsysl}" "${pkgdir}/etc/init.d/rsyslog"

    sed -e "${_shebang}" -e "${_binpath}" -e "${_runpath}" -i "${pkgdir}/etc/init.d/rsyslog"
}

package_sane-openrc() {
    pkgdesc="OpenRC sane init script"
    depends=('openrc-core' 'sane')
    backup=('etc/conf.d/saned')
    install=sane.install

    install -Dm755 "${srcdir}/${_Csane}" "${pkgdir}/etc/conf.d/saned"
    install -Dm755 "${srcdir}/${_Isane}" "${pkgdir}/etc/init.d/saned"
    local _p1='s|/run/saned/saned.pid|/run/saned.pid|'
    sed -e "${_shebang}" -e "${_runpath}" -e "${_binpath}" -e ${_p1} -i ${pkgdir}/etc/init.d/saned
}

package_fuse-openrc(){
    pkgdesc="OpenRC fuse init script"
    depends=('openrc-core' 'fuse')
    install=fuse.install

    install -Dm755 "${srcdir}/${_Ifuse}" "${pkgdir}/etc/init.d/fuse"
    sed -e "${_shebang}" -i "${pkgdir}/etc/init.d/fuse"
}

package_metalog-openrc() {
    pkgdesc="OpenRC metalog init script"
    depends=('openrc-core' 'metalog')
    backup=('etc/conf.d/metalog')
    install=metalog.install

    install -Dm755 "${srcdir}/${_Cmeta}" "${pkgdir}/etc/conf.d/metalog"
    install -Dm755 "${srcdir}/${_Imeta}" "${pkgdir}/etc/init.d/metalog"

    sed -e "${_shebang}" -e "${_binpath}" -e "${_runpath}" -i "${pkgdir}/etc/init.d/metalog"
}

package_syslog-ng-openrc() {
    pkgdesc="OpenRC syslog-ng init script"
    depends=('openrc-core' 'syslog-ng')
    backup=('etc/conf.d/syslog-ng')
    install=syslog-ng.install

    install -Dm755 "${srcdir}/${_Csyslog}" "${pkgdir}/etc/conf.d/syslog-ng"
    install -Dm755 "${srcdir}/${_Isyslog}" "${pkgdir}/etc/init.d/syslog-ng"

    sed -e "${_shebang}" -e "${_binpath}" -e "${_runpath}" -i "${pkgdir}/etc/init.d/syslog-ng"
}

package_lm_sensors-openrc() {
    pkgdesc="OpenRC lm_sensors init script"
    depends=('openrc-core' 'lm_sensors')
    #backup=('etc/conf.d/sensord')
    install=lm_sensors.install

    #install -Dm755 "${srcdir}/${_Csens}" "${pkgdir}/etc/conf.d/sensord"
    install -Dm755 "${srcdir}/${_Isens1}" "${pkgdir}/etc/init.d/sensord"
    install -Dm755 "${srcdir}/${_Isens2}" "${pkgdir}/etc/init.d/fancontrol"
    install -Dm755 "${srcdir}/${_Isens3}" "${pkgdir}/etc/init.d/lm_sensors"

    for f in ${pkgdir}/etc/init.d/*; do
      sed -e "${_shebang}" -e "${_binpath}" -e "${_runpath}" -i $f
    done
}

package_lirc-utils-openrc() {
    pkgdesc="OpenRC lirc-utils init script"
    depends=('openrc-core' 'lirc-utils')
    backup=('etc/conf.d/lircd'
	    'etc/conf.d/irexec')
    install=lirc-utils.install

    install -Dm755 "${srcdir}/${_Clirc1}" "${pkgdir}/etc/conf.d/lircd"
    install -Dm755 "${srcdir}/${_Ilirc1}" "${pkgdir}/etc/init.d/lircd"

    install -Dm755 "${srcdir}/${_Clirc2}" "${pkgdir}/etc/conf.d/irexec"
    install -Dm755 "${srcdir}/${_Ilirc2}" "${pkgdir}/etc/init.d/irexec"

    install -Dm755 "${srcdir}/${_Ilirc3}" "${pkgdir}/etc/init.d/lircmd"

    for f in ${pkgdir}/etc/init.d/*;do
      sed -e "${_shebang}" -e "${_binpath}" -e "${_runpath}" -i $f
    done
}

package_haveged-openrc() {
    pkgdesc="OpenRC haveged init script"
    depends=('openrc-core' 'haveged')
    backup=('etc/conf.d/haveged')
    install=haveged.install

    install -Dm755 "${srcdir}/${_Chaveg}" "${pkgdir}/etc/conf.d/haveged"
    install -Dm755 "${srcdir}/${_Ihaveg}" "${pkgdir}/etc/init.d/haveged"

    sed -e "${_shebang}" -e "${_binpath}" -i "${pkgdir}/etc/init.d/haveged"
}

package_salt-openrc() {
    pkgdesc="OpenRC salt init scripts"
    depends=('openrc-core' 'salt')
    backup=('etc/conf.d/salt-master'
		  'etc/conf.d/salt-minion'
		  'etc/conf.d/salt-syncdic')
    install=salt.install

    install -Dm755 "${srcdir}/${_Csalt_mtr}" "${pkgdir}/etc/conf.d/salt-master"
    install -Dm755 "${srcdir}/${_Isalt_mtr}" "${pkgdir}/etc/init.d/salt-master"

    install -Dm755 "${srcdir}/${_Csalt_min}" "${pkgdir}/etc/conf.d/salt-minion"
    install -Dm755 "${srcdir}/${_Isalt_min}" "${pkgdir}/etc/init.d/salt-minion"

    install -Dm755 "${srcdir}/${_Csalt_sync}" "${pkgdir}/etc/conf.d/salt-syncdic"
    install -Dm755 "${srcdir}/${_Isalt_sync}" "${pkgdir}/etc/init.d/salt-syncdic"

    for f in ${pkgdir}/etc/init.d/*;do
	    sed -e "${_shebang}" -e "${_runpath}" -i $f
    done

}

package_mpd-openrc(){
    pkgdesc="OpenRC fuse init script"
    depends=('openrc-core' 'mpd')
    install=mpd.install

    install -Dm755 "${srcdir}/${_Impd}" "${pkgdir}/etc/init.d/mpd"
    sed -e "${_shebang}" -i "${pkgdir}/etc/init.d/mpd"
}

package_hdparm-openrc() {
    pkgdesc="OpenRC hdparm init script"
    depends=('openrc-core' 'hdparm')
    backup=('etc/conf.d/hdparm')
    install=hdparm.install

    install -Dm755 "${srcdir}/${_Chdparm}" "${pkgdir}/etc/conf.d/hdparm"
    install -Dm755 "${srcdir}/${_Ihdparm}" "${pkgdir}/etc/init.d/hdparm"

    sed -e "${_shebang}" -i "${pkgdir}/etc/init.d/hdparm"
}

package_thermald-openrc() {
    pkgdesc="OpenRC thermald init script"
    depends=('dbus-openrc' 'thermald')
    install=thermald.install

    install -Dm755 "${srcdir}/${_Itherm}" "${pkgdir}/etc/init.d/thermald"
}

package_xe-guest-utilities-openrc() {
    pkgdesc="OpenRC xe-guest-utilities init script"
    depends=('openrc-core' 'xe-guest-utilities')
    install=xe-guest-utilities.install

    install -Dm755 "${srcdir}/${_Ixe}" "${pkgdir}/etc/init.d/xe-daemon"
    
    sed -e ${_shebang} -e ${_runpath} -e ${_binpath} \
	-i ${pkgdir}/etc/init.d/xe-daemon
}

package_virtualbox-guest-utils-openrc() {
	pkgdesc="OpenRC virtualbox-guest-utils init script"
	depends=('openrc-core' 'virtualbox-guest-utils')
	install=virtualbox-guest-additions.install

	install -Dm755 "${srcdir}/${_Ivbox}" "${pkgdir}/etc/init.d/vboxservice"
	
	local _p1='s|vboxguest-service|VBoxService|' \
	      _p2='s|/sbin/modprobe|/usr/bin/modprobe|g'

	sed -e "${_shebang}" -e "${_binpath}" -e "${_runpath}" -e "${_p1}" -e "${_p2}" -i "${pkgdir}/etc/init.d/vboxservice"
}

package_zfs-openrc() {
    pkgdesc="OpenRC zfs init script"
    depends=('openrc-core' 'zfs-utils')
    install=zfs.install

    install -Dm755 "${srcdir}/${_Izfs}" "${pkgdir}/etc/init.d/zfs"
}

package_clamav-openrc() {
    pkgdesc="OpenRC clamav init script"
    depends=('openrc-core' 'clamav')
    backup=('etc/conf.d/clamd')
    install=clamav.install

    install -Dm755 "${srcdir}/${_CClam}" "${pkgdir}/etc/conf.d/clamd"
    install -Dm755 "${srcdir}/${_IClam}" "${pkgdir}/etc/init.d/clamd"

    sed -e "${_shebang}" -e "${_binpath}" -i "${pkgdir}/etc/init.d/clamd"
}

package_networkmanager-openrc() {
    pkgdesc="OpenRC networkmanager init script"
    depends=('openrc-core' 'networkmanager-consolekit')
    backup=('etc/conf.d/NetworkManager')
    install=networkmanager.install

    install -Dm755 "${srcdir}/${_CNM}" "${pkgdir}/etc/conf.d/NetworkManager"
    install -Dm755 "${srcdir}/${_INM}" "${pkgdir}/etc/init.d/NetworkManager"

    install -Dm755 "${srcdir}/${_SNM}" "${pkgdir}/etc/NetworkManager/dispatcher.d/10-openrc-status"

    sed -e 's|@EPREFIX@/sbin|/usr/bin|' \
	-e 's|@EPREFIX@/usr/sbin|/usr/sbin|' \
	-e 's|#!/bin/sh|#!/usr/bin/sh|' \
	-i "${pkgdir}/etc/NetworkManager/dispatcher.d/10-openrc-status"

    sed -e "${_shebang}" -e "${_binpath}" -e "${_runpath}" -i "${pkgdir}/etc/init.d/NetworkManager"
}

sha256sums=('ceada7a1c9e8b62cff506bc94a1813706c7de1ed23daf9c3450ad549df4fafb7'
            'f0b15a0334f6177a6cf23cb9b169302c75745dc30857f24a7d11892feb6b1ee4'
            '204c66d2b7d4d20115acc7499708cf538538fe1c100281ad55f909508041fb19'
            '197e44ba1f438a18f5f7d9f5858feb19c1ece4286d82a5e63caf9be5b964aa76'
            '4dd4e7fa07bf2ab2d4f5753156f5df0ad2277523f6755b0eab3d2db3480989e2'
            '22a22c914d2a4f0fb5fc8495f4b7efcd1819efde548c9033ca612c181cd29eda'
            'ec9f05b386a06a4b2d5398cc0c33f34eba3f5e74ad46ae203d682f8ebc593f99'
            '906c31e0817517dc6c141a7a10565140ea272d3c958a065f520a0ecb6f81912f'
            'b29325498ee3b1f3d63672efcd1e93f0745eecdb9f4bb05fed82a2f085399484'
            'b95392c69b26418a2c9ba31c88263501c272378736d79407afb156cc66abd157'
            'd36ff77fa193a065d25e373723e03f1a9471205151b82c73a6574cce4f095962'
            'c404ad3b624004cab25bd3a89593cdeb0abbc25771d6e52caf2f37cb4f7b2b79'
            '1b1f2970cc81a6053fcb6c0ead786436b6423c67170087dde283e54f32ae16e5'
            '5e5a31fbd93294a6e210499a880fcab371b23706824c9d60d827b0187d7bade4'
            'd47f22a33a83c14a4a0c333d6a445c40e550c491899fb0c6d323e23fe1eac7b7'
            '9ab6f022d2b2948660decf5e383984e6ddb9e9e5e6e2761c3031378ddd87e947'
            '25f2a1665c88dc5227698bdedc2098d6e37d12d8b966f00e2a180c95a33cc8b4'
            '4bd482a54decc5a51aee60e19ae31b0182d5857b112754247f04c0829b159b07'
            '36d489296c31736f8015b0ce27052b3f1555b7fe6335120c0477b044b8e4fb8d'
            '9b018f9f7a0975988387858823fe59a5cd8af6413d8c3170db0e24aac6021ec3'
            '40803821f498267f6567436eedc18201b5ae4b5390d6872fb15a94200c2ac06f'
            'c7dc517cdb5ee10e2a07ccea15ec47ba0b7aff8ac1469204c8d7faf71bcae2c5'
            '97282007801cb9c0e3b431e2930dec3bb8ce8869f63f7e02d903846e96734684'
            '22a4b5e4c934ea8ba66764441b0bb60d31d23c147c8b64a4a035947327bfc3ec'
            '2e4a42dd64b7c6dacfcfefdab8dc1e7c45d7a0966ef8b928583d18393362c719'
            '8fbd405ad951e7ad046e4408abb98f4066077113187198767d52f28d7228bae4'
            '4705b68372090ee7db69da1ad35131551ed1ba99032db2486ff6c31d2170ce6b'
            '767a160c1b3392f0a12d3908a937548a2f604a9a121e744c309ee6f478420b02'
            'f0a561f124cac3791fba6ee7ef5bc3ea46bd7535edf9e864689b0d9cfa65d332'
            '3b53f4aabf937766b5aa806561e9b97ab2be49ac25d76ae97f4fca4ab7a42e33'
            '365e9cbde2564a0430d8d1c0f8bc367db2bb32937ebf61649196f0e6a1ab5363'
            '9f3f47a7af4d349a7c525455616139b5019d3b7d0290398ba8c50ab91a62d089'
            'c5eed64899811966220d04e4b9849ba77d2d111f34dc16f03960cf1ff5ec02da'
            '286148f5391d42c04a62a13cc125fa2130b5821e50da913c5a20d3a913e5f2d1'
            '06415d7f958210a4dd1490db5796b0d3c08392a81547f290776d9164dde786ae'
            '286148f5391d42c04a62a13cc125fa2130b5821e50da913c5a20d3a913e5f2d1'
            '2de9f69462bc3b575a69a150b6bba21a6e341477010d284cb77614e810a7bf8c'
            '3591473024005cdb15f13809c7675fbb964dc1b13e7658a01e12e34c7e751897'
            '37c95ff723fa578e9039613d09dbf790d99113a318c065422986c744519214e9'
            '434beee81ba04c96fcd03e6b37a4578c2c25af2c1007368469c48dd37523d56e'
            '105afc0382fc5adc03ed644dba4e78817015a55432349f259a286ac3c1b06628'
            '2eaef8071b34c1a3d55271d283b31e25e081791e48a6a55eb394912e4954ba48'
            '24cbcf298b869e4451b08aeba0e3e4948aa7faaac649f18e8f600ae5fb86a8fb'
            '605e7fe4dea401547957db63e45f3f75ae2da3544b0ff1f3279fcf07217d5aac'
            '7321272190ea9846ab7e19b034649c1cd711d4f94a6bdcaaaec2f683bb822e7d'
            '4bbb4e610d2d6bb22d83aa2980dca052a23b90fa6985c8245601b716dec986f4'
            '28ebd47810b0568fc7692218867d6804a1df70290681462f5555e230ca817732'
            'c00bb921afe65e31a9ac4bbcfc97e4c9afa7ad77604c2dcb7eedc152fec5bbd8'
            '4594573f01fe5e04b6dde4525796acf909158591bdcefd662ec23fe0d1c3e1bd'
            '5f368362ef5c6deed538f20dc582d6da3c86871bd42297fa78536c0312021843'
            'f8ed424818b866a0bf882c569f4484e8b1485ce7ac8c472f060fd877f2dcfe65')

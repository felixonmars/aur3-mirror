# Maintainer: Mika Hynnä <igheax@gmail.com>
pkgname=acpi-eee904
pkgver=9
pkgrel=10
pkgdesc="ACPI scripts and AsusOSD for the Asus Eee PC 904HD"
url="http://kapsi.fi/ighea/eee/acpi-eee/"
arch=('i686')
license=('GPL2')
groups=(eee)
depends=('acpid' 'vbetool' 'xorg-xauth')
#makedepends=('deb2targz' 'unrar')
install=acpi-eee.install
backup=(etc/acpi/eee.conf)
source=(acpi-eee.install suspend2ram.sh wlan.sh display.sh
        volume-{up,down,toggle} wlan-{on,off}
        button-{power,sleep} display-toggle
	lid-event lid.sh
	button-ap ap-button.sh power-button.sh
	powersource powersource.sh
	eee.conf
	)

build() {
	cd $startdir/src

	# install modified volume-control.sh needed by asusosd to show correct volume levels
	#cp usr/local/bin/*.sh ${startdir}/pkg/usr/bin
	install -m0755 volume_control.sh $startdir/pkg/usr/bin/ || return 1
	mkdir ${startdir}/pkg/usr/share
	cp -r usr/local/share/* ${startdir}/pkg/usr/share

	# install our scripts
	mkdir -p $startdir/pkg/etc/acpi
	install -m0755 wlan.sh $startdir/pkg/etc/acpi/
	install -m0755 suspend2ram.sh $startdir/pkg/etc/acpi/
	install -m0755 display.sh $startdir/pkg/etc/acpi/
        install -m0755 lid.sh $startdir/pkg/etc/acpi/
        install -m0755 ap-button.sh $startdir/pkg/etc/acpi/
        install -m0755 powersource.sh $startdir/pkg/etc/acpi/
        install -m0755 power-button.sh $startdir/pkg/etc/acpi/

  	# install custom events
	mkdir -p $startdir/pkg/etc/acpi/events
	install -m0644 volume-{up,down,toggle} $startdir/pkg/etc/acpi/events/
	# Kernel 2.6.26.1 and eeert2860 1.7.0.0 can't bring
	# wlan back up, so disable that event
	#install -m0644 wlan-{on,off} $startdir/pkg/etc/acpi/events/
	install -m0644 button-{ap,power,sleep} $startdir/pkg/etc/acpi/events/
	install -m0644 display-toggle $startdir/pkg/etc/acpi/events/
        install -m0644 lid-event $startdir/pkg/etc/acpi/events/
	install -m0644 powersource $startdir/pkg/etc/acpi/events/

	# finally install default configuration file
	install -m0644 eee.conf $startdir/pkg/etc/acpi/
}

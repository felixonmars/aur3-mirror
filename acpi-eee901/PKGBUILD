# Maintainer: Mika Hynnä <igheax@gmail.com>
# Modified heavily by Jon Booth -- jbooth on the forums
#
# Events that need done:
#	top row buttons:
#		0000001a "backlight off"
#		0000001b "resolution switch"
#		0000001c "user defined"
#		0000001d "user defined"
#	power events:
#		00000051 "on battery"
#		00000050 "on wall power"
pkgname=acpi-eee901
pkgver=9
pkgrel=10
pkgdesc="ACPI scripts and AsusOSD for the Asus Eee PC 901"
url="http://kapsi.fi/ighea/eee/acpi-eee/"
arch=('i686')
license=('GPL2')
groups=(eee)
depends=('acpid' 'vbetool' 'xorg-xauth')
makedepends=('deb2targz' 'unrar')
install=acpi-eee.install
backup=(etc/acpi/eee.conf)

build() {
	cd $startdir/src

	# Compile asusosd and install
	unrar e -y ASUS_ACPI_071126.rar
	tar xzf asus_osd.tar.gz

	cd asus_osd
        # Switch to /usr instead of /usr/local 2008.02.04 MWJ
        sed -i 's|/usr/local|/usr|g' *
	# Correct volume mute/on switching
	patch -p0 < $startdir/asusosd-volume_toggle_fix.patch || return 1
	patch -p0 < $startdir/asusosd-osd_configurable.patch || return 1
        make
        install -D -m0755 asusosd $startdir/pkg/usr/bin/asusosd

	#and the flashy icons for asusosd
	cd ${startdir}/src
	deb2targz asus-acpi-p9xx_1.4-1_i386.deb || return 1

	tar -xzf asus-acpi-p9xx_1.4-1_i386.tar.gz

	# install modified volume-control.sh needed by asusosd to show correct volume levels
	#cp usr/local/bin/*.sh ${startdir}/pkg/usr/bin
	install -m0755 volume_control.sh $startdir/pkg/usr/bin/ || return 1
	mkdir ${startdir}/pkg/usr/share
	cp -r usr/local/share/* ${startdir}/pkg/usr/share

	#File for autostarting asusosd
#	install -D -m0644 ../Asusosd.desktop $startdir/pkg/etc/xdg/autostart/Asusosd.desktop

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


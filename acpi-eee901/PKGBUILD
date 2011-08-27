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
source=(acpi-eee.install suspend2ram.sh wlan.sh display.sh
        volume-{up,down,toggle} wlan-{on,off}
        button-{power,sleep} display-toggle
	lid-event lid.sh
	button-ap ap-button.sh power-button.sh
	powersource powersource.sh
	http://update.eeepc.asus.com/p901/pool/asus-acpi-p9xx_1.4-1_i386.deb
	ftp://ftp.asus.com/pub/ASUS/EeePC/701/ASUS_ACPI_071126.rar
	Asusosd.desktop volume_control.sh 
	asusosd-volume_toggle_fix.patch 
	eee.conf
	asusosd-osd_configurable.patch
	)

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

md5sums=('3c8867f7f830d937553f4903520022ab'
         '39cd1c3ad6c8e6838ba715574514c941'
         '312f9c866ac7d5a75be06eb8e86db4c9'
         '1b088c402c5f45fbdbbd29890fa09371'
         'a993d583726348f52e141384e438646e'
         'baa9be8e2f5d6d2eb31a7be5c39a74b2'
         'c519d047b648c5859c928e191be98bd5'
         '6d6b2c66169059514ad0f8c8be8b024a'
         'b5df10121971b7c3458491819a879f54'
         '0f6bbfdc536e2b470481876994bafb0c'
         'cdac9707cf2c7affedcd254e0b94cfdb'
         '6d36f13db3d77a625c7912fe05847827'
         '679cad23f80f1437c6ef65e592a2a7dc'
         'c65818b1656777fe3c37d3ccddfd517a'
         'b58ad8749ed7c97bd4a7754c12bb73ae'
         'a712160b7d1b7724ffd5a92739b58505'
         '1e3810ab2f0035b6e2016477c643b780'
         'c3ac0f09047f11e230f7c0226a39eb27'
         'a4f6449f4ebe0e9cfdd3bc00a342e723'
         'da2f08e7f6fd827a10af16c045a5ef15'
         '9f4b2815b8965624e639d1e7588b6cd0'
         '06a0e13292ac49e82f144a0b0af9f61f'
         '760a15c663efe4d1f2e94dcd05a90145'
         '1ca0c5c988dbb1b267f824aef9f1a60c'
         '1bc8fbedb9d4b8fc7975944d69a598e3'
         '58319289b45b27861a045c28eeac5496')

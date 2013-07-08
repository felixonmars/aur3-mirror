# Maintainer: Mika Hynnä <igheax@gmail.com>
pkgname=acpi-eee
pkgver=10.0
pkgrel=1
pkgdesc="ACPI scripts and AsusOSD for the Asus Eee PC"
url="http://kapsi.fi/ighea/eee/acpi-eee/"
arch=('i686')
license=('GPL2')
groups=(eee)
depends=('acpid' 'vbetool')
makedepends=('deb2targz' 'unrar')
install=acpi-eee.install
backup=(etc/acpi/eee.conf)
source=(
	volume-{up,down,toggle}
        wlan-{on,off}
        button-{power,sleep} 
        display-toggle
	lid-event 
	button-ap
	powersource
	
	lid.sh
	suspend2ram.sh 
	wlan.sh 
	display.sh
	ap-button.sh 
	power-button.sh
	powersource.sh
	volume_control.sh	

	http://update.eeepc.asus.com/p701/pool/asus-acpi_1.38-1xandros5_i386.deb
	http://non7top.googlecode.com/files/ASUS_ACPI_071126.rar

	Asusosd.desktop 
	asusosd-volume_toggle_fix.patch 
	asusosd-osd_configurable.patch
	
	eee.conf
	eee.rc
	acpi-eee.install
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
	deb2targz asus-acpi_1.38-1xandros5_i386.deb || return 1

	tar -xzf asus-acpi_1.38-1xandros5_i386.tar.gz

	# install modified volume-control.sh needed by asusosd to show correct volume levels
	#cp usr/local/bin/*.sh ${startdir}/pkg/usr/bin
	install -m0755 volume_control.sh $startdir/pkg/usr/bin/ || return 1
	mkdir ${startdir}/pkg/usr/share
	cp -r usr/local/share/* ${startdir}/pkg/usr/share

	#File for autostarting asusosd
	install -D -m0644 ../Asusosd.desktop $startdir/pkg/etc/xdg/autostart/Asusosd.desktop

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
	install -m0644 wlan-{on,off} $startdir/pkg/etc/acpi/events/
	install -m0644 button-{ap,power,sleep} $startdir/pkg/etc/acpi/events/
	install -m0644 display-toggle $startdir/pkg/etc/acpi/events/
        install -m0644 lid-event $startdir/pkg/etc/acpi/events/
	install -m0644 powersource $startdir/pkg/etc/acpi/events/

	# rc-script:
	mkdir -p $startdir/pkg/etc/rc.d || return 1
        install -m0755 eee.rc $startdir/pkg/etc/rc.d/eee || return 1

	# finally install default configuration file
	install -m0644 eee.conf $startdir/pkg/etc/acpi/
}


md5sums=('315ce5e7b87b4ca7083fd0daaf5d394d'
         'b0b9d034186ef1213570b90d6c865425'
         'dc7cbe699d7ffbf75b33058ed3fddb02'
         '6d6b2c66169059514ad0f8c8be8b024a'
         'b5df10121971b7c3458491819a879f54'
         '0f6bbfdc536e2b470481876994bafb0c'
         'cdac9707cf2c7affedcd254e0b94cfdb'
         '91d31222311be60442168a9ee4f1f060'
         '679cad23f80f1437c6ef65e592a2a7dc'
         'b58ad8749ed7c97bd4a7754c12bb73ae'
         'c3ac0f09047f11e230f7c0226a39eb27'
         'c65818b1656777fe3c37d3ccddfd517a'
         '1780e6f5ca427fb708510851f762cd2c'
         '428f9d3034a2ed07e03b46de0d8c8ba8'
         '7d749f0a3a9209e9a41011d5f1e0dcc7'
         'a712160b7d1b7724ffd5a92739b58505'
         'ed9f9fb82a3003ba432507ebcc4408a4'
         'c0f8acc4dad29bfbcd2dae31613ab3a7'
         'c7496612dd777f10ea2cbc7d06a37c5f'
         '4c66da8ddc5b0aa8521eb638e048e6f8'
         '9f4b2815b8965624e639d1e7588b6cd0'
         '06a0e13292ac49e82f144a0b0af9f61f'
         '1ca0c5c988dbb1b267f824aef9f1a60c'
         '58319289b45b27861a045c28eeac5496'
         '1bc8fbedb9d4b8fc7975944d69a598e3'
         '52f19bb786f47d438e844b342b90b79d'
         'b6e205d8e689a723dd92360ea0f1743e')

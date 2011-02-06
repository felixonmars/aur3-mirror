# Contributor: Simone Pignatti <simo91.linux@gmail.com>

pkgname=e3acpi
pkgver=1.1
pkgrel=1
pkgdesc="ACPI scripts and AsusOSD for the Asus Eee PC"
url="http://update.eeepc.asus.com/p900/pool"
arch=('i686')
license=('GPL2')
depends=('acpid' 'vbetool')
makedepends=('deb2targz' 'unrar')
optdepends=('htop')
install=acpi.install
backup=('etc/acpi/eee.conf')
source=(http://update.eeepc.asus.com/p900/pool/asus-acpi_1.61-1xandros19_i386.deb
	ftp://ftp.asus.com/pub/ASUS/EeePC/701/ASUS_ACPI_071126.rar
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
	Asusosd.desktop 
	asusosd-volume_toggle_fix.patch 
	asusosd-osd_configurable.patch
	eee.conf
	eee.rc
	acpi.install)
md5sums=('1c7d9c4b5fc6848c6a2aa9b411a13316'
         '9f4b2815b8965624e639d1e7588b6cd0'
         '315ce5e7b87b4ca7083fd0daaf5d394d'
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
         'fc78b8cb016fc66ae37c2c97ed07309a'
         'dc2065dbace3856d8972c9cc9dff100e'
         'a712160b7d1b7724ffd5a92739b58505'
         'ed9f9fb82a3003ba432507ebcc4408a4'
         'c0f8acc4dad29bfbcd2dae31613ab3a7'
         'c7496612dd777f10ea2cbc7d06a37c5f'
         '06a0e13292ac49e82f144a0b0af9f61f'
         '1ca0c5c988dbb1b267f824aef9f1a60c'
         '58319289b45b27861a045c28eeac5496'
         'b60022008099133848e1bc3c46d4c677'
         'f8d1fe7ef1afae2a4f6bb0769e06376b'
         '0a062c093a46e0f6c21d8c76cd12b1f9')

build() {
	cd "$srcdir"
	# Compile asusosd and install
	unrar e -y ASUS_ACPI_071126.rar
	tar xzf asus_osd.tar.gz
	cd asus_osd
        # Switch to /usr instead of /usr/local
        sed -i 's|/usr/local|/usr|g' *
	# Correct volume mute/on switching
	patch -p0 < $startdir/asusosd-volume_toggle_fix.patch || return 1
	patch -p0 < $startdir/asusosd-osd_configurable.patch || return 1
        make
        install -D -m0755 asusosd "$pkgdir"/usr/bin/asusosd
	# And the flashy icons for asusosd
	cd "$srcdir"
	deb2targz asus-acpi_1.61-1xandros19_i386.deb || return 1
	tar -xzf asus-acpi_1.61-1xandros19_i386.tar.gz
	# Install modified volume-control.sh needed by asusosd to show correct volume levels
	install -m0755 volume_control.sh "$pkgdir"/usr/bin/ || return 1
	mkdir "$pkgdir"/usr/share
	cp -r usr/local/share/* "$pkgdir"/usr/share
	# File for autostarting asusosd
	install -D -m0644 ../Asusosd.desktop "$pkgdir"/etc/xdg/autostart/Asusosd.desktop
	# Install our scripts
	install -d "$pkgdir"/etc/acpi
	install -m0755 wlan.sh "$pkgdir"/etc/acpi/
	install -m0755 suspend2ram.sh "$pkgdir"/etc/acpi/
	install -m0755 display.sh "$pkgdir"/etc/acpi/
        install -m0755 lid.sh "$pkgdir"/etc/acpi/
        install -m0755 ap-button.sh "$pkgdir"/etc/acpi/
        install -m0755 powersource.sh "$pkgdir"/etc/acpi/
        install -m0755 power-button.sh "$pkgdir"/etc/acpi/
  	# Install custom events
	install -d "$pkgdir"/etc/acpi/events
	install -m0644 volume-{up,down,toggle} "$pkgdir"/etc/acpi/events/
	install -m0644 wlan-{on,off} "$pkgdir"/etc/acpi/events/
	install -m0644 button-{ap,power,sleep} "$pkgdir"/etc/acpi/events/
	install -m0644 display-toggle "$pkgdir"/etc/acpi/events/
        install -m0644 lid-event "$pkgdir"/etc/acpi/events/
	install -m0644 powersource "$pkgdir"/etc/acpi/events/
	# Rc-script
	install -d "$pkgdir"/etc/rc.d || return 1
        install -m0755 eee.rc "$pkgdir"/etc/rc.d/eee || return 1
	# Install default configuration file
	install -m0644 eee.conf "$pkgdir"/etc/acpi/
}

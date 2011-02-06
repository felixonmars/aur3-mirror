# Maintainer: 	Robert David <robert.david.public@gmail.com>
# Adapted from acpi-eee901 pkgver=14 pkgrel=2 by Nicolas Bigaouette <nbigaouette@gmail.com>

pkgname=acpi-eee1000
pkgver=1
pkgrel=1
pkgdesc="ACPI scripts and AsusOSD for the Asus Eee PC 1000"
url="http://robertek.brevnov.net/files/linux/arch/acpi-eee/"
arch=(i686)
license=(GPL2)
depends=(acpid vbetool xorg-xauth)
makedepends=(deb2targz unrar)
optdepends=(htop)
install=acpi-eee.install
backup=(etc/acpi/eee.conf)
source=(suspend2ram.sh wlan.sh cardr.sh fsb.sh bluetooth.sh
	http://update.eeepc.asus.com/p901/pool/asus-acpi-p9xx_1.4-1_i386.deb
	ftp://ftp.asus.com/pub/ASUS/EeePC/701/ASUS_ACPI_071126.rar
	asusosd.patch
	volume_control.sh
	eee.conf
	user
	eee-handler.sh
	eee-anything
	buttonblank.sh buttonres.sh
	fsb
	HighPerformance.png PowerSaving.png SuperPerformance.png
	BluetoothOff.png BluetoothOn.png
    eee-me.conf
    wlan-me.sh
    acpi-eee1000_asusosd-1.patch acpi-eee1000_asusosd-2.patch
	)
md5sums=('345e004a317d740782cbc595850b19f6'
         '3970286351ef673cac02e79f6cee31b8'
         '36544b9f9ae485c6a33f8847c043a7b0'
         '9fe8618a3a4d30d2adac50439b173449'
         '9d6858b65c80f56a02a0421961b92503'
         'da2f08e7f6fd827a10af16c045a5ef15'
         '9f4b2815b8965624e639d1e7588b6cd0'
         'f5f19c50f3c19cb4554226cf4fb1073e'
         'fb76a8146dd8bf0d31cedaf664b7379c'
         '5b2d40aead673f939b31e968d4982a5b'
         'c9e5d153813d6d1e1c582640ab774a85'
         'ce7eb0f0b893baee2e6f60fa7a5a9430'
         '6b7be279e511fffd640ab5f82b28ec37'
         '7a258968318b1821efd804509d962357'
         'fd232329f443118a0ac5b90e18b6252d'
         '1b25e94ec16bc1e42690749e47bcbfc8'
         '37ecf257b21117c90087cc2bd94400b1'
         '1478f5286de74caed5dad415a68a7227'
         '8f44a8459f51fa9fc1a33ceca75608ac'
         '88f3a64d5f1b45b1d90f55cda0913f41'
         '62979e8e6af4b899713d4d48bdb8ab39'
         '9b2f966c4862a6fa69a77cea4b1d3b2d'
         'ce73f9d20ac5b254519ae43c7949d86a'
         '9164562a7dcf73164ca7763ba278d50b'
         '5f6cc122cbd242e2df55d4431e3c0c5a')

build() {
	cd $srcdir || return 1

	# Compile asusosd and install
	unrar e -y ASUS_ACPI_071126.rar || return 1
	tar xzf asus_osd.tar.gz || return 1

	cd asus_osd || return 1
        # Switch to /usr instead of /usr/local 2008.02.04 MWJ
        sed -i 's|/usr/local|/usr|g' * || return 1
	# Patch asusosd with our changes
	patch < $srcdir/asusosd.patch || return 1

    # Patch for the 1000
    msg "$srcdir/acpi-eee1000_asusosd-1.patch..."
    patch -Np2 -i $srcdir/acpi-eee1000_asusosd-1.patch || return 1
    msg "$srcdir/acpi-eee1000_asusosd-2.patch..."
    patch -Np2 -i $srcdir/acpi-eee1000_asusosd-2.patch || return 1

        make || return 1
        install -D -m0755 asusosd $pkgdir/usr/bin/asusosd || return 1

	#and the flashy icons for asusosd
	cd $srcdir || return 1
	deb2targz asus-acpi-p9xx_1.4-1_i386.deb || return 1

	tar -xzf asus-acpi-p9xx_1.4-1_i386.tar.gz || return 1

	# install modified volume-control.sh needed by asusosd to show correct volume levels
	install -m0755 volume_control.sh $pkgdir/usr/bin/ || return 1
	mkdir -p $pkgdir/usr/share
	cp -r usr/local/share/* $pkgdir/usr/share

	# install our power management icons
    mkdir -p $pkgdir/usr/share/asus_osd || return 1
    for f in $(ls $srcdir/*.png); do
        install -m0644 $f $pkgdir/usr/share/asus_osd/$(basename $f) || return 1
    done

	# install our scripts
	_EEEDIR=$pkgdir/etc/acpi/eee
	mkdir -p $_EEEDIR || return 1
	install -m0755 eee-handler.sh $pkgdir/etc/acpi/ || return 1
# 	install -m0755 wlan.sh $_EEEDIR || return 1
    install -m0755 wlan-me.sh ${_EEEDIR}/wlan.sh || return 1
	install -m0755 suspend2ram.sh $_EEEDIR || return 1
	install -m0755 cardr.sh $_EEEDIR || return 1
	install -m0644 user $_EEEDIR || return 1
	install -m0755 fsb.sh $_EEEDIR || return 1
	install -m0755 buttonblank.sh $_EEEDIR || return 1
	install -m0755 buttonres.sh $_EEEDIR || return 1
	install -m0755 bluetooth.sh $_EEEDIR || return 1

  	# install custom events
  	_EVENTSDIR=$pkgdir/etc/acpi/events
	mkdir -p $_EVENTSDIR || return 1
	install -m0644 eee-anything $_EVENTSDIR || return 1

	# install fsb initscript
	mkdir -p $pkgdir/etc/rc.d || return 1
	install -m0744 fsb $pkgdir/etc/rc.d || return 1

	# finally install default configuration file
	#install -m0644 eee.conf $pkgdir/etc/acpi/ || return 1
    install -m0644 eee-me.conf $pkgdir/etc/acpi/eee.conf || return 1
}


pkgname=nrserver-free
pkgver=2.1.2.4326
pkgrel=1
pkgdesc="NeoRouter is a cross-platform zero-configuration VPN solution"
url="http://www.neorouter.com/"
license=('custom')
arch=('i686' 'x86_64')
conflicts=('nrserver')
provides=('nrserver')
options=('!strip')
depends=()
makedepends=('rpmextract')
install=nrserver-free.install
source=(http://download.neorouter.com/Downloads/NRFree/Update_$pkgver/Linux/CentOS/nrserver-$pkgver-free-centos-i386.rpm 'nrserver.service')
md5sums=('82638efadba7bbb35eaa65e36f19f92c'
         'd36bf55b94871288697eead0f878614c')
if test "$CARCH" == x86_64; then
source=(http://download.neorouter.com/Downloads/NRFree/Update_$pkgver/Linux/CentOS/nrserver-$pkgver-free-centos-x86_64.rpm 'nrserver.service')
md5sums=('897afec85225b1719eaa060d41d3a1c6'
         'd36bf55b94871288697eead0f878614c')
fi

build() {
	case ${CARCH} in
	    i686)
		cd $srcdir/
		rpmextract.sh $startdir/src/nrserver-$pkgver-free-centos-i386.rpm
		rm $startdir/src/nrserver-$pkgver-free-centos-i386.rpm
                ;;
	    x86_64)
		cd $srcdir/
		rpmextract.sh $startdir/src/nrserver-$pkgver-free-centos-x86_64.rpm
		rm $startdir/src/nrserver-$pkgver-free-centos-x86_64.rpm
		;;
	esac
}

package() {
        cd $srcdir/

        msg2 "Installing bin Files..."
        mkdir -p "$pkgdir/usr/bin"
        cp usr/bin/* "$pkgdir/usr/bin" 

        msg2 "Installing readme files..."
        mkdir -p "$pkgdir/usr/local/ZebraNetworkSystems/NeoRouter/"
        cp usr/local/ZebraNetworkSystems/NeoRouter/* "$pkgdir/usr/local/ZebraNetworkSystems/NeoRouter/"

        msg2 "Installing systemd service..."
        mkdir -p $pkgdir/usr/lib/systemd/system/
        cp $startdir/nrserver.service $pkgdir/usr/lib/systemd/system/
}


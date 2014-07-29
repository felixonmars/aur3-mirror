pkgname=nrclient-free
pkgver=2.1.2.4326
pkgrel=1
pkgdesc="NeoRouter is a cross-platform zero-configuration VPN solution"
url="http://www.neorouter.com/"
license=('custom')
arch=('i686' 'x86_64')
conflicts=('nrclient')
provides=('nrclient')
options=('!strip')
depends=()
makedepends=('rpmextract')
install=nrclient.install
source=(http://download.neorouter.com/Downloads/NRFree/Update_$pkgver/Linux/CentOS/nrclient-$pkgver-free-centos-i386.rpm 'nrclient.service')
md5sums=('2696920a2a1088a879813c70a651f1e6'
         '051c0ba7598249e035368f8ecb6ea44d')
if test "$CARCH" == x86_64; then
source=(http://download.neorouter.com/Downloads/NRFree/Update_$pkgver/Linux/CentOS/nrclient-$pkgver-free-centos-x86_64.rpm 'nrclient.service')
md5sums=('b8f411cdb6f87d342b57c1b41f333368'
         '051c0ba7598249e035368f8ecb6ea44d')
fi

build() {
        case ${CARCH} in
            i686)
                cd $srcdir/
                rpmextract.sh $startdir/src/nrclient-$pkgver-free-centos-i386.rpm
                rm $startdir/src/nrclient-$pkgver-free-centos-i386.rpm
                ;;
            x86_64)
                cd $srcdir/
                rpmextract.sh $startdir/src/nrclient-$pkgver-free-centos-x86_64.rpm
                rm $startdir/src/nrclient-$pkgver-free-centos-x86_64.rpm
                ;;
        esac
}

package() {
	cd $srcdir/

	msg2 "Installing bin files..."
	mkdir -p "$pkgdir/usr/bin"
	cp usr/bin/* "$pkgdir/usr/bin" 

	msg2 "Installing readme files..."
	mkdir -p "$pkgdir/usr/local/ZebraNetworkSystems/NeoRouter/"
	cp usr/local/ZebraNetworkSystems/NeoRouter/* "$pkgdir/usr/local/ZebraNetworkSystems/NeoRouter/"

	msg2 "Installing systemd service..."
	mkdir -p "$pkgdir/usr/lib/systemd/system"
	cp $startdir/nrclient.service "$pkgdir/usr/lib/systemd/system"
}

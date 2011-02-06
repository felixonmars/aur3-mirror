# Contributor: ignotus ignotus21.at.gmail.com

pkgname=opendxsamples
pkgver=4.4.0
pkgrel=1
pkgdesc="Samples for OpenDX 4.4.0"
url="http://www.opendx.org/"
license="custom"
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://opendx.npaci.edu/source/dxsamples-$pkgver.tar.gz)
md5sums=('e8f43722ca0a66282608bded7c0e4f93')

build() {

    cd $startdir/src/dxsamples-$pkgver
    ./configure --prefix=/usr/lib --exec-prefix=/usr/bin --with-javadx=no
    make || return 1
    make DESTDIR=$startdir/pkg install

    # fix bin prefix
    mv $startdir/pkg/usr/lib/bin $startdir/pkg/usr

}


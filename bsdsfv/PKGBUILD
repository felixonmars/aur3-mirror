pkgname=bsdsfv
pkgver=1.18
pkgrel=2
pkgdesc="An all-in-one SFV utility"
url="http://bsdsfv.sourceforge.net"
license=('BSD')
arch=('i686' 'x86_64')
source=(
    http://downloads.sourceforge.net/bsdsfv/bsdsfv-${pkgver}.tar.gz
    bsdsfv-1.18-64bit.patch
)
md5sums=('381df19a827d5a20097ab95ea9e760fa'
	 '20aa8110089872b2c4ae292a254e8dad')

build() {
    cd $startdir/src/$pkgname

    patch < ../bsdsfv-1.18-64bit.patch || return 1
    make || return 1
    install -Dm755 bsdsfv $startdir/pkg/usr/bin/bsdsfv
    sed -n '/Copyright/,/SUCH DAMAGE\./p' bsdsfv.c > LICENSE
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

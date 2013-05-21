# Contributor: Roberto Nobrega <rwnobrega@gmail.com>
pkgname=mizar
pkgver=7.13.01_4.181.1147
pkgrel=1
pkgdesc="An attempt to reconstruct mathematical vernacular into a formal language which can be read by humans and also verified by software (binary only)"
arch=('i686' 'x86_64')
url="http://mizar.org/"
license=('custom')
depends=()
makedepends=()
optdepends=('emacs: GNU Emacs Lisp mode support')
install=${pkgname}.install
source=(ftp://mizar.uwb.edu.pl/pub/system/current/$pkgname-$pkgver-i386-linux.tar)
md5sums=('b5a1a01f0876f9e0954434f15fa67fb7')

package() {
    $srcdir/install.sh --nodialog <<< "$pkgdir/usr/bin
        $pkgdir/usr/share/$pkgname
        $pkgdir/usr/share/doc/$pkgname" > /dev/null
    cd $pkgdir
    mkdir -p etc/profile.d
    echo "export MIZFILES=/usr/share/$pkgname" > etc/profile.d/$pkgname.sh
}

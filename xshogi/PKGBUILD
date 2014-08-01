# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Daenyth <Daenyth+Arch@gmail.com>

pkgname=xshogi
pkgver=1.4.2
pkgrel=1
pkgdesc="A program that plays shogi (Japanese chess) - X-based version"
arch=(i686 x86_64)
url=http://www.cs.caltech.edu/~mvanier/hacking/$pkgname/$pkgname.html
license=(GPL2)
depends=(libxaw xorg-fonts-100dpi gnushogi)
source=(ftp://ftp.gnu.org/gnu/gnushogi/$pkgname-$pkgver.tar.gz)
sha256sums=('2e2f1145e3317143615a764411178f538bd54945646b14fc2264aaeaa105dab6')
sha512sums=('fa037e31df4c27449862efd9d9e300baa489ec55f35e5a2c9ed5b8a7901eeb424f2d0f1ed1048f570b7babba9c750ebfc2d4cfb3f1910320c97179338cfc474c')

prepare() {
    sed -i -e 's:/man/man6\|/info:/share&:g' -e 's:-ltermcap::g' $pkgname-$pkgver/Makefile.in
}

build() {
    cd $pkgname-$pkgver/
    ./configure --prefix=/usr
    make
}

package() {
    make -C $pkgname-$pkgver DESTDIR="$pkgdir" prefix=/usr install
}

# Maintainer: Vinzenz Vietzke <vinz@vinzv.de>
pkgname=kickshaw
_rname="RC_source_only"
pkgver=0.5
pkgrel=1
epoch=
pkgdesc=""
arch=('any')
url="http://download.savannah.gnu.org/releases/obladi/"
license=('GPL')
groups=()
depends=('openbox' 'gtk3')
source=(http://download.savannah.gnu.org/releases/obladi/kickshaw_0.5_RC_source_only.tar.bz2)
noextract=()
md5sums=('a3c25fd5a8ea216339502c89a0e21fcc')

build() {
  cd "$srcdir/kickshaw_$pkgver/source"
  #./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/kickshaw_$pkgver/source"
  mkdir -p ${pkgdir}/usr/bin/
  make PREFIX="$pkgdir/usr" DESTDIR="$pkgdir/usr/bin" install
}

# vim:set ts=2 sw=2 et:

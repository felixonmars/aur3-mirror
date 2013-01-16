# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Dylon Edwards <deltaecho@archlinux.us>

pkgname=gtw
pkgver=0.0.9
pkgrel=2
pkgdesc="A graphical front-end for 'Translate Word'"
arch=('i686' 'x86_64')
url="http://savannah.nongnu.org/projects/twandgtw/"
license=('GPL')
depends=('gconf' 'tw')
makedepends=('gob2' 'pkgconfig>=0.9.0')
source=(http://download.savannah.gnu.org/releases/twandgtw/$pkgname-$pkgver.tar.bz2)
md5sums=('579ae53a716e3daf126978cfa4c5b8e0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

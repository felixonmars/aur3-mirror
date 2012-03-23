# Maintainer: Your Name <youremail@domain.com>
pkgname=seturgent
pkgver=1.4
pkgrel=2
epoch=
pkgdesc="A small utility to set an application's urgency hint."
arch=(x86_64 i486 arm)
url="http://www.codemadness.nl/blog/2010/10/31/seturgent-set-urgency-hints-for-x-applications/"
license=('GPL')
groups=()
depends=(libx11)
source=(http://codemadness.nl/downloads/projects/seturgent/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('74ac42d5a637536a7987f50168862f62')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX="usr/" install
}

# vim:set ts=2 sw=2 et:

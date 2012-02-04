# Contributor: ivh <ivovh@users.sf.net>
pkgname=enemies-of-carlotta
pkgver=1.2.6
pkgrel=1
pkgdesc="A simple mailing-list manager written in Python"
arch=('i686' 'x86_64')
url="http://www.e-o-c.org/"
license=('GPL')
depends=('python' 'procmail')
backup=()
options=()
source=("http://liw.iki.fi/liw/eoc/$pkgname-$pkgver.tar.gz")

build() {
  cd "$startdir/src/$pkgname-$pkgver"

  sed -i "s/prefix = \/usr\/local/prefix = \/usr/" ./Makefile || exit 1
  make DESTDIR="$startdir/pkg" install || exit 1
}

# vim:set ts=2 sw=2 et:
md5sums=('f0edc16e86d89333117f94f0294574b1')
sha1sums=('4d3b84192a87041b2f7c4e3e325b8499d90ec055')

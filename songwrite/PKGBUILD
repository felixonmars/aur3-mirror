# Contributor: Patrick Leslie Polzer <leslie.polzer@gmx.net>
# Contributor: Eric Forgeot < http://ifiction.free.fr >

pkgname=songwrite
pkgver=0.14
pkgrel=1
pkgdesc="Tablature editor in Python/Tk"
arch=(i686 x86_64)
url="http://home.gna.org/oomadness/en/songwrite/index.html"
license=""
depends=('editobj' 'python' 'tk')
makedepends=()
conflicts=(songwrite2)
replaces=()
backup=()
install=
source=(http://download.gna.org/songwrite/Songwrite-$pkgver.tar.gz)
md5sums=()

build() {
  cd $startdir/src/Songwrite-$pkgver
  python setup.py bdist
  cd $startdir/pkg
  tar xvfz $startdir/src/Songwrite-$pkgver/dist/Songwrite-$pkgver.linux-i686.tar.gz
}

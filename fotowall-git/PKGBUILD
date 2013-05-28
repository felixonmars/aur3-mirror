# Maintainer: mathieui <mathieui@mathieui.net>
# Contributor: Ner0

pkgname=fotowall-git
pkgver=20120227.eff7aa1
pkgrel=1
pkgdesc="A tool for rendering collages from your favorite photos or pictures (git version)"
arch=('i686' 'x86_64')
url="http://fotowall.googlecode.com/"
license=('GPL2')
depends=('qt4')
makedepends=('git')
provides=('fotowall')
conflicts=('fotowall')
source=('git://github.com/enricoros/fotowall.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/fotowall"
  git log -1 --format='%cd.%h' --date=short | tr -d - | sed 's/-/./'
}

build() {
  cd "$srcdir/fotowall"
  qmake-qt4
  sed -i 's/-lpthread/-lpthread\ -lX11/' Makefile
  make
}

package() {
  cd "$srcdir/fotowall"
  make INSTALL_ROOT="$pkgdir/" install
}

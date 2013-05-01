# Contributor: James Harrison <james@talkunafraid.co.uk>

_pkgname=melted
pkgname=melted-git
pkgver=1401.2c79b60
pkgrel=1
pkgdesc="A video playout server aimed at broadcast automation"
arch=('i686' 'x86_64')
url="http://mltframework.org/"
license=('LGPL')
depends=('mlt-git')
makedepends=('git')
provides=('melted')
conflicts=('melted')
source=('git://github.com/mltframework/melted.git')
md5sums=('SKIP')


pkgver() {
  cd $_pkgname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/$_pkgname"

  #./autogen.sh
  ./configure --prefix=/usr --enable-gpl
  make
}

package() {
  cd "$srcdir/$_pkgname-build"

  make DESTDIR="$pkgdir/" install
}


# Maintainer: ogasser <oliver.gasser@gmail.com>
pkgname=microdc2-git
pkgver=9586072
pkgrel=1
pkgdesc="Command-line based Direct Connect client that uses the GNU Readline library for user interaction."
arch=('i686' 'x86_64' 'armv6h')
url="https://github.com/jnwatts/microdc2"
license=('GPL')
depends=('libxml2')
makedepends=('git')
conflicts=('microdc2')
provides=('microdc2')
source=('git://github.com/jnwatts/microdc2.git')
md5sums=('SKIP')
_gitname='microdc2'


pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname
  make
}

package() {
  cd $_gitname
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

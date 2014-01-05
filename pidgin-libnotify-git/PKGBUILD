# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
# Contributor: Hugo Doria <hugodoria@gmail.com>
# Contributor pidgin-libnotify: 3ED <kas1987@o2.pl>

_gitname=pidgin-libnotify
pkgname=pidgin-libnotify-git
pkgver=r13.b225a45
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="pidgin plugin that enables popups when someone logs in or messages you - tony2001's fork with new features and fixes"
url="https://github.com/tony2001/pidgin-libnotify"
license=('GPL')
depends=('pidgin' 'libnotify')
makedepends=('intltool')
provides=$_gitname
conflicts=$_gitname
optdepends=('notification-daemon')
source=("git+https://github.com/tony2001/$_gitname.git")

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_gitname

  ./autogen.sh
  ./configure --prefix=/usr --disable-deprecated --disable-static
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir" install
}
sha512sums=('SKIP')

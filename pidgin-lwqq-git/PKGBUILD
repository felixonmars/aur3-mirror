# Maintainer: Felix Yan <felixonmars@gmail.com>

# Defaulting to dev branch, change to master if you want a more stable version
branch=dev

pkgname=pidgin-lwqq-git
_gitname=pidgin-lwqq
pkgver=v0.3.1.4.g489caea
pkgrel=1
pkgdesc="A pidgin plugin based on lwqq, a excellent safe useful library for webqq protocol"
arch=('i686' 'x86_64')
url="https://github.com/xiehuc/pidgin-lwqq"
license=('GPL3')
depends=('libpurple' 'curl' 'libev' 'hicolor-icon-theme' 'js185' 'lwqq-git')
optdepends=('telepathy-haze: Empathy plugin support')
makedepends=('git' 'cmake')
provides=(pidgin-lwqq)
conflicts=(pidgin-lwqq)
options=(!strip)
source=("git://github.com/xiehuc/pidgin-lwqq.git#branch=$branch")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "$srcdir/$_gitname"
}

build() {
  cd "$srcdir/$_gitname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug .
  make
}

package()
{
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
}

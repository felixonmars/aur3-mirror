# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>
# Contributor: Stefan Lohmaier <noneuss@gmail.com>
# Contributor (since 9 jun 2010): Juan Diego Tascon

_gitname=yukon
pkgname=$_gitname-git
pkgver=159.988a002
pkgrel=1
pkgdesc='A screencapture solution for gaming.'
arch=(i686 x86_64)
license=('GPL')
url='https://github.com/wereHamster/yukon/wiki'
depends=('libgl' 'libx11' 'seom-git')
makedepends=('git' 'yasm')
conflicts=('yukon')
provides=('yukon')
replaces=('yukon-svn')
source=("$_gitname::git+https://github.com/wereHamster/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$_gitname"

  ./configure --prefix='/usr'
  make
}

package() {
  cd "$_gitname"

  make DESTDIR="$pkgdir" install
  install -D sysconf "$pkgdir/etc/yukon/system/sysconf"
}

# vim:syntax=sh

# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=zile-git
pkgver=3.840.g4b716fd
pkgrel=2
pkgdesc="Zile Implements Lua Editors"
arch=('any')
url="http://www.gnu.org/software/zile/"
license=('GPL3')
depends=('lua' 'lua-stdlib' 'lua-posix' 'lua-alien' 'lrexlib')
makedepends=('git' 'emacs' 'help2man' 'specl' 'ldoc')
provides=('zile')
source=(git://git.savannah.gnu.org/zile.git)
md5sums=('SKIP')
_gitname="zile"

pkgver() {
  cd $srcdir/$_gitname
  git describe --tags | sed 's|-|.|g' | cut -c2-
}

prepare() {
  cd $srcdir/$_gitname
  sed -i 38,39d bootstrap.conf
}

build() {
  cd "$srcdir/$_gitname"
  ./bootstrap
  ./configure --prefix=/usr --docdir=/usr/share/$pkgname
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}

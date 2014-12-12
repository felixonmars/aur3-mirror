# Maintainer: James Zhu <jimmylzhu@gmail.com>
# Upstream URL: https://github.com/antirez/linenoise

pkgname=mpc-parser-git
pkgver=r90.79bd501
pkgrel=1
pkgdesc="A Parser Combinator library for C."
arch=('i686' 'x86_64')
url="https://github.com/orangeduck/mpc"
license=('BSD')
makedepends=('git' 'premake')
options=(staticlibs)

_gitroot=('git://github.com/orangeduck/mpc.git')
_gitname=('mpc')
_name=('mpc-parser')

source=("$_gitroot" 'premake4.lua')
md5sums=('SKIP' b7edcab60f63886e7a892a39b4fa451d)

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cp premake4.lua "$srcdir/$_gitname"
  cd "$srcdir/$_gitname"
  premake4 gmake
  make config=release
}

package() {
  cd $srcdir/$_gitname
  install -D -m755 lib/libmpc.a "$pkgdir"/usr/lib/libmpc-parser.a
  install -D -m755 mpc.h        "$pkgdir"/usr/include/mpc-parser.h
  install -D -m644 LICENSE.md   "$pkgdir"/usr/share/licenses/$_name/LICENSE
}

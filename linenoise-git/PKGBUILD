# Maintainer: James Zhu <jimmylzhu@gmail.com>
# Upstream URL: https://github.com/antirez/linenoise

pkgname=linenoise-git
pkgver=r110.cf1bdf5
pkgrel=1
pkgdesc="A minimal, zero-config, BSD licensed, readline replacement."
arch=('i686' 'x86_64')
url="https://github.com/antirez/linenoise"
license=('BSD')
makedepends=('git' 'premake')
options=(staticlibs)

_gitroot=('git://github.com/antirez/linenoise.git')
_gitname=('linenoise')

source=("$_gitroot" 'premake4.lua')
md5sums=('SKIP' C69B47CD774688C87323C93E7766CD01)

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
  mkdir -p "$pkgdir"/usr/{lib,include,share/licenses/$_gitname}
  install -D -m755 lib/liblinenoise.a "$pkgdir"/usr/lib
  install -D -m755 linenoise.h        "$pkgdir"/usr/include
  install -D -m644 README.markdown    "$pkgdir"/usr/share/licenses/$_gitname
}

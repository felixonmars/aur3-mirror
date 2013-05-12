# Maintainer: Vadim Ushakov <igeekless@gmail.com>

pkgname=iolanguage-git
pkgver=20130512
pkgrel=1
pkgdesc="A prototype-based programming language inspired by Smalltalk, Self, NewtonScript, Act1, LISP, and Lua."
arch=('i686' 'x86_64')
url="http://iolanguage.org"
license=('BSD')
depends=('glibc')
makedepends=('cmake')
conflicts=('iolanguage')
provides=('iolanguage')
source=('git+https://github.com/stevedekorte/io.git')
md5sums=('SKIP')

_gitname="io"

pkgver() {
  date +%Y%m%d
}

build() {

  mkdir -p "${_gitname}/build"
  cd "${_gitname}/build"

  # Remove -j option from MAKEFLAGS. Parallel build fails for some reason.
  export MAKEFLAGS="`echo "$MAKEFLAGS" | sed 's/-j[0-9]\{1,\}/ /'`"

  cmake -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=/usr  ".."
  make
}

package()
{
  cd "${_gitname}/build"

  make DESTDIR=$pkgdir install

  cd ..

  install -d -m 755 "${pkgdir}/usr/share/doc/io" || return 1
  cp -R docs/* "${pkgdir}/usr/share/doc/io" || return 1

  install -d -m 755 "${pkgdir}/usr/share/io/samples" || return 1
  cp -R samples/* "${pkgdir}/usr/share/io/samples" || return 1
}

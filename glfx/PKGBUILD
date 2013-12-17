# Maintainer: Jiaxi Hu <sftrytry_AT_gmail_DOT_com>

pkgbase=glfx
pkgname=('glfx')
pkgver=0.75
pkgrel=1
pkgdesc="GLFX allows you to create effect files for your OpenGL project."
arch=('i686' 'x86_64')
license=('BSD')
url="http://code.google.com/p/glfx/"
depends=()
makedepends=('cmake')
source=("http://glfx.googlecode.com/files/$pkgname-$pkgver-src.zip")
md5sums=('81c1df77d371bbfd834073a4c3783615')

_cmakeopts=('. 
            -DCMAKE_INSTALL_PREFIX=/usr 
            -DCMAKE_BUILD_TYPE=Release')


build() {
  cd "$srcdir/$pkgname"

  cmake ${_cmakeopts[@]} 

  make
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir" install

  # install license file
  install -Dm644 "$srcdir/$pkgname/COPYING" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

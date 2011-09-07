pkgname=ibus-googlepinyin-hg
pkgver=2
pkgrel=2
pkgdesc="IBus Wrapper for libgooglepinyin"
arch=('any')
url="http://code.google.com/p/libgooglepinyin"
license=('APACHE')
optdepends=(
    'opencc: for simplified chinese translation to tranditional chinese'
)
depends=('libgooglepinyin-hg' 'ibus')
makedepends=( 'mercurial' 'cmake')
provides=('ibus-googlepinyin')
conflicts=('ibus-googlepinyin')

_hgroot=https://ibus-wrapper.libgooglepinyin.googlecode.com/hg/
_hgrepo=ibus-googlepinyin

build(){
  cd "$srcdir"

  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -rf "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  find . -type f -name '*.py' | xargs sed -i 's|/usr/bin/python|/usr/bin/python2|g'
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make DESTDIR=${pkgdir} install
}

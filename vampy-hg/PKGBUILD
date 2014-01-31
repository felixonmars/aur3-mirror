# Maintainer: Sašo Živanović <saso dot zivanovic at guest dot arnes dot si>
_pkgname=vampy
pkgname=${_pkgname}-hg
pkgver=64.4ffa
pkgrel=1
pkgdesc="A wrapper plugin that enables you to use Vamp plugins written in Python."
arch=('i686' 'x86_64')
url="http://www.vamp-plugins.org/vampy.html"
license=('BSD')
depends=(python2 vamp-plugin-sdk)
makedepends=(mercurial)
optdepends=('python2-numpy: to utilize numpy when writing plugins')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("hg+https://code.soundsoftware.ac.uk/hg/vampy")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  local _id=$(hg identify -i)
  echo $(hg identify -n).${_id:0:4}
}

prepare() {
  cd $srcdir/$_pkgname
  msg "  Preparing Makefile ..."
  # 1. Install into /usr/lib/vamp
  # 2. vamp-plugin-sdk provides a shared library
  sed '/^INSTALL_DIR/s/\/usr\/local\/lib\/vamp/\/usr\/lib\/vamp/;
       /^LDFLAGS/s/-Wl,-Bstatic -lvamp-sdk/-Wl,-Bdynamic -lvamp-sdk/;' \
       Makefile.linux > Makefile
}

build() {
    cd $srcdir/$_pkgname
    make
}

package() {
  cd $srcdir/$_pkgname
  make DESTDIR=$pkgdir install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

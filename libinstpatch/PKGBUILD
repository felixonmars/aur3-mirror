# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=libinstpatch
pkgver=1.0.0
pkgrel=3
pkgdesc="A library for processing digital sample based MIDI instrument patch files."
arch=(i686 x86_64)
url="http://sourceforge.net/apps/mediawiki/swami/index.php?title=Main_Page"
license=('GPL')
depends=('libsndfile' 'glib2' 'python2')
makedepends=('intltool')
options=('!libtool')
source=("http://downloads.sourceforge.net/project/swami/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('eca9c505fd0c47fd1f59d40598e8eb63')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # python2 fix
  export PYTHON=python2

  # configure fix
  sed -i "s_echo\( \$PYTHON\)_which\1_g" -i configure

  # DSO link fix
  LIBS=" -lgobject-2.0 -lglib-2.0" \
  ./configure --prefix=/usr \
              --enable-static=no
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

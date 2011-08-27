# Maintainer : Maintainer <dreamspepser at yahoo dot it>
# Contributor: Philipp Überbacher <murks at lavabit dot com>

_pkg=lv2fil
pkgname=lv2-fil-plugins
pkgver=2.0
pkgrel=2
pkgdesc="Four-band parametric equalisers with visualisation."
arch=('i686' 'x86_64')
url="http://nedko.arnaudov.name/soft/$_pkg/"
license=('GPL')
depends=('lv2core' 'pygtk' 'python2-liblo')
provides=('lv2fil' 'lv2-fil')
conflicts=('lv2fil-git' 'lv2fil' 'lv2-fil-git' 'lv2-fil')
groups=('lv2-plugins')
source=("$url$_pkg-$pkgver.tar.bz2")
md5sums=('dc1a54c3a35b3639755b985cdcd281b6')

build() {
  cd "$srcdir/$_pkg-$pkgver"

  # python 2 fixes
  sed -i "s|python2*|python2|g" `grep -Erl python .`

  python2 waf configure --lv2-dir=/usr/lib/lv2
  python2 waf
}

package() {
  cd "$srcdir/$_pkg-$pkgver"

  python2 waf install --destdir="$pkgdir/"
}

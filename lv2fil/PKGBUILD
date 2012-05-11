# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Philipp Überbacher <murks at lavabit dot com>

pkgname=lv2fil
pkgver=2.0
pkgrel=7
pkgdesc="Four-band parametric equalisers with visualisation"
arch=('i686' 'x86_64')
url="http://nedko.arnaudov.name/soft/lv2fil/"
license=('GPL')
depends=('lv2' 'pygtk' 'python2-pyliblo')
conflicts=('lv2-fil-plugins')
replaces=('lv2-fil-plugins')
source=("$url$pkgname-$pkgver.tar.bz2")
md5sums=('dc1a54c3a35b3639755b985cdcd281b6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 ./waf configure --lv2-dir=/usr/lib/lv2
  python2 ./waf
}

package() {  
  cd "$srcdir/$pkgname-$pkgver"
  python2 ./waf install --destdir="$pkgdir"

  # python2 fix
  sed -i "s/python/&2/" `find "$pkgdir" -name ui`
}

# vim:set ts=2 sw=2 et:

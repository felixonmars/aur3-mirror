# Contributor:  Leslie P. Polzer <polzer@stardawn.org>
pkgname=slat
pkgver=0.4b
pkgrel=1
pkgdesc="Theremin synthesizer"
url="http://dis-dot-dat.net/index.cgi?item=/code/slat/"
license="GPL"
arch=('i686')
depends=(gcc-libs jack-audio-connection-kit libsm imlib)
source=(http://dis-dot-dat.net/content/code/slat/$pkgname-$pkgver.tar.bz2)
md5sums=('fcbd4d8360783d590e9a86747ec7021f')
sha1sums=('97dad66a84435a6042d967c7d55d2207eac00b8e')

build() {
  cd $startdir/src/$pkgname

  make || return 1

  install -D -m a+rx slat $startdir/pkg/usr/bin/slat
  mkdir -p $startdir/pkg/usr/share/slat
  install -m a+r {bg,mp}.png $startdir/pkg/usr/share/slat
}

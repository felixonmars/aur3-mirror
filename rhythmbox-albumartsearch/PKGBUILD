# Contributor: twa022 <twa022 at gmail dot com>

pkgname=rhythmbox-albumartsearch
pkgver=0.2
pkgrel=1
pkgdesc="A plugin that provides a coverflow widget to rhythmbox audio player"
arch=(i686 x86_64)
url="http://code.google.com/p/rhythmbox-coverflow-plugin/"
depends=('rhythmbox' 'pywebkitgtk' 'python-mako')
makedepends=()
license=('GPL')
options=()
source=('http://albumartsearch.googlecode.com/files/albumartsearch_0.2.tar.gz')

build() {
  cd $srcdir

  mkdir -p $pkgdir/usr/lib/rhythmbox/plugins
  cp -R $srcdir/albumartsearch $pkgdir/usr/lib/rhythmbox/plugins
}

md5sums=('3fdce0184f0bbddd1926c84276b609c9')

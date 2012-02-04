# Contributor: lo3 <smoke.v@gmail.com>
pkgname=bitstormlite
pkgver=0.2q
pkgrel=1
pkgdesc="BitStormLite is a BitTorrent Client based on c++/gtk+2.0"
arch=('any')
url="http://sourceforge.net/projects/bbom/"
license=('GPLv2')
depends=('libstdc++5' 'gtk2' 'curl')
source=(http://downloads.sourceforge.net/sourceforge/bbom/BitStormLite-$pkgver.tar.gz)
md5sums=(486072d9cb0ca84061e69c559265ce13)

build() {
  cd $startdir/src/BitStormLite-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}

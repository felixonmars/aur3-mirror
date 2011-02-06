# Contributor: Chris Baker <baker.chris.3@gmail.com>
pkgname=spicetrade
pkgver=1.2
pkgrel=1
pkgdesc="Will Abu be able to beat out the Europeans in the spice trade?"
arch=('i686' 'x86_64')
url="http://www.spicetrade.org/"
license=('LGPL')
depends=('java-runtime')
makedepends=('apache-ant')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/Spice%20Trade%20v$pkgver/$pkgname-${pkgver}src.zip
        spicetrade.desktop
        spicetrade.sh) 
md5sums=('4c17d6634d96d350cda58fb319d2587b'
         '09f7633cf4592db271323f9025d5d327'
         'eccdfeb25ac9afc030408ae69f7c5080')

build() {
  cd $srcdir/Spicetrade
  ant || return 1
  install -D -m644 dist/Spicetrade-$pkgver.jar $pkgdir/usr/share/java/spicetrade/Spicetrade-$pkgver.jar || return 1
  install -D -m644 pics/navigation/abus/abu_young01.png $pkgdir/usr/share/pixmaps/spicetrade.png || return 1
  install -D -m644 $srcdir/spicetrade.desktop $pkgdir/usr/share/applications/spicetrade.desktop || return 1
  install -D -m755 $srcdir/spicetrade.sh $pkgdir/usr/bin/spicetrade || return 1
}


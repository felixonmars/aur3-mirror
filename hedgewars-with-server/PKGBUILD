# Contributor: BeholdMyGlory <larvid@gmail.com>
pkgname=hedgewars-with-server
_pkgname=hedgewars
pkgver=0.9.13
pkgrel=1
pkgdesc="Free Worms-like turn based strategy game, includes server"
arch=(i686 x86_64)
url="http://hedgewars.org"
license=('GPL2')
depends=('qt' 'sdl' 'sdl_mixer' 'sdl_image' 'sdl_net' 'sdl_ttf' 'lua')
makedepends=('fpc' 'cmake' 'ghc' 'haskell-http' 'haskell-stm' 'haskell-dataenc' 'haskell-hslogger' 'haskell-utf8-string')
conflicts=('hedgewars')
source=(http://download.gna.org/${_pkgname}/${_pkgname}-src-${pkgver}.tar.bz2
        hedgewars.desktop
        hedgewars.png)
md5sums=('b91de13d54670970568b56f150cf9fe4'
         '48c66a3204d4fa0a69e9aa46f7c31e0c'
         'eeb14d50df39063549ac5eca9dbc65d1')

build() {
  install -D -m644 $startdir/src/hedgewars.png $startdir/pkg/usr/share/pixmaps/hedgewars.png && \
  install -D -m644 $startdir/src/hedgewars.desktop $startdir/pkg/usr/share/applications/hedgewars.desktop || return 1
  
  cd "$srcdir/$_pkgname-src-$pkgver"
  
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DWITH_SERVER=1 . || return 1
  make || return 1
  make DESTDIR=${pkgdir} install
}

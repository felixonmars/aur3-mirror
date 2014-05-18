# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=talesofmajeyal
_tarname=t-engine4-src
pkgver=1.1.5
pkgrel=2
pkgdesc="A free, open source rougelike RPG, featuring tactical turn-based combat and advanced character building"
arch=(i686 x86_64)
url="http://te4.org/"
license=('GPL3' 'custom')
depends=('libgl' 'sdl2' 'sdl2_image' 'sdl2_ttf' 'openal' 'libvorbis' 'glu')
makedepends=('mesa' 'premake')
source=("http://te4.org/dl/t-engine/${_tarname}-${pkgver}.tar.bz2"
        $pkgname)
md5sums=('2015792a28a64748aa6caa20040c94a5'
         '1e7cd1885707868379d6963f2b1e5ac1')

prepare() {
  cd "$_tarname-$pkgver"

  # generate Makefiles
  premake4 gmake

  # fix where the Makefiles think SDL is located
  sed -i 's:/opt/SDL-2.0:/usr/:g' build/*
}

build() {
  cd "$_tarname-$pkgver"

  make config=release
}

package() {
  cd "$_tarname-$pkgver"
  _DEST="$pkgdir/opt/$pkgname"

  # Makefile doesn't have an install recipe, so just dump everything important into /opt
  install -dm755 "$_DEST"
  cp -r game bootstrap t-engine "$_DEST"

  # install a simple launch script to /usr/bin
  install -dm755 "$pkgdir/usr/bin"
  install -m755 "$srcdir/$pkgname" "$pkgdir/usr/bin"

  # install license files
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 COPYING-TILES "$pkgdir/usr/share/licenses/$pkgname/COPYING-TILES"
  install -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

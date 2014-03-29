# Maintainer: Nick Hu <nickhu00@gmail.com>
pkgname=cataclysm-dda
pkgver=0.A
pkgrel=2
pkgdesc="Cataclysm: Dark Days Ahead is an actively maintained roguelike set in a post-apocalyptic world, forked from the original."
arch=('i686' 'x86_64')
url="http://www.cataclysmdda.com/"
license=('CCPL:by-sa')

depends=('lua51' 'sdl' 'sdl_ttf' 'sdl_image' 'gcc-libs' 'glibc' 'freetype2'
         'zlib' 'bzip2' 'libpng')
if test "$CARCH" == x86_64; then
  depends=('lib32-lua51' 'lib32-sdl' 'lib32-sdl_ttf' 'lib32-sdl_image'
          'lib32-gcc-libs' 'lib32-glibc' 'lib32-freetype2' 'lib32-zlib'
          'lib32-bzip2' 'lib32-libpng')
fi

install='cataclysm-dda.install'
source=('http://assets.cataclysmdda.com/downloads/linux_binaries/cddasdl-current.tar.gz')
md5sums=('4a79ea0bc8e5e6952bf7fd8a3cc8beba')

prepare() {
  cd "$srcdir/cataclysmdda-${pkgver}"
  sed -i 's/\x6C\x69\x62\x6C\x75\x61\x35\x2E\x31\x2E\x73\x6F\x2E\x30/\x6C\x69\x62\x6C\x75\x61\x35\x2E\x31\x2E\x73\x6F\x00\x00/' cataclysm-tiles

  sed -i 's|DIR=.*|DIR=/usr/share/cataclysm-dda\n|' cataclysm-launcher
}

package() {
  cd "$srcdir/cataclysmdda-${pkgver}"
  install -Dm755 cataclysm-launcher "$pkgdir/usr/bin/cataclysm-dda"
  install -Dm755 cataclysm-tiles "$pkgdir/usr/share/cataclysm-dda/cataclysm-tiles"
  install -dm775 -g games "$pkgdir/usr/share/cataclysm-dda/data"
  cp -r data/* "$pkgdir/usr/share/cataclysm-dda/data"
  cp -r gfx lang lua "$pkgdir/usr/share/cataclysm-dda"
  install -dm775 -g games "$pkgdir/var/games"
  install -dm775 -g games "$pkgdir/var/games/cataclysm-dda"
  install -dm775 -g games "$pkgdir/var/games/cataclysm-dda/save"
  ln -s "/var/games/cataclysm-dda/save" "$pkgdir/usr/share/cataclysm-dda/save"
}

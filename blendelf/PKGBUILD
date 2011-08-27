# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=blendelf
pkgver=0.9_beta3
pkgrel=1
pkgdesc="An open source 3d game engine."
arch=(i686 x86_64)
url="http://$pkgname.com/"
license=('GPL' 'custom')
depends=('assimp' 'bullet' 'enet' 'freeimage' 'freetype2' 'glew' 'glfw' 'libvorbis' 'lua' 'openal')
conflicts=("$pkgname-git")
source=("${url}downloads/$pkgname-${pkgver/_/-}-source.zip"
        "enet-1.3.patch"
        "makefile.patch")
md5sums=('622802df4cbb30c13fee538b5e80ac36'
         '768fc210873d7c2ea73a1f163e931de1'
         '8d175491ff0696b9c2ab17a31693c901')

build() {
  cd "$srcdir/$pkgname-${pkgver/_/-}-source"

  # network patch
  patch -p1 -i ../enet-1.3.patch

  # makefile patch
  patch -p1 -i ../makefile.patch

  # python2 fix
  sed -i "s|python2\?\(.*\)|python2\1|g" `grep -rl python .`

  make
}

package() {
  cd "$srcdir/$pkgname-${pkgver/_/-}-source"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

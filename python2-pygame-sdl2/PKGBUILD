# Maintainer: Cravix < dr dot neemous at gmail dot com >

pkgname=python2-pygame-sdl2
_pkgname=pygame_sdl2
pkgver=6.99.4
pkgrel=1
pkgdesc="A new, SDL2-based implementation of the Pygame API (shipped along with Ren'Py)"
arch=('i686' 'x86_64')
url="https://github.com/renpy/$_pkgname"
license=('LGPL2.1' 'zlib')
depends=('sdl2' 'sdl2_gfx' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf')
makedepends=('git')
source=("http://www.renpy.org/dl/${pkgver}/${_pkgname}-for-renpy-${pkgver}.tar.bz2"
        'cython.patch')
md5sums=('2ad91e9ee0bd79e6e74b999165390302'
         '5d3aee6b640b5e58bf98442eb443eef3')

build() {
  cd "$srcdir/pygame-sdl2-for-renpy-${pkgver}"

  patch -Np0 -i ../cython.patch
  python2 setup.py build
}

package() {
  cd "$srcdir/pygame-sdl2-for-renpy-${pkgver}"
  python2 setup.py install --root="$pkgdir" || return 1
}

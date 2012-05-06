# Maintainer: bjorn <bjorn lindeijer nl>
# Contributor: wido <widowild [at] myopera [dot] com>
# Contributor: Feufochmar <guill.delacourt@gmail.com>

pkgname=mana
pkgver=0.6.1
pkgrel=2
pkgdesc="Client for The Mana World (TMW)."
arch=('i686' 'x86_64')
url="http://manasource.org/"
license=('GPL')
depends=('curl' 'guichan' 'libgl' 'libxml2' 'mesa' 'physfs' 'sdl_image' 'sdl_mixer' 'sdl_net' 'sdl_ttf' 'sdl_gfx')
makedepends=('cmake' 'gettext')
optdepends=()
provides=('mana')
conflicts=('tmw' 'tmw-svn' 'mana-git')
source=("http://manasource.org/files/$pkgname-$pkgver.tar.gz"
        "0001-Fixed-compilation-errors-and-warnings-with-GCC-4.7.patch")
md5sums=('1115f6c67606c0c14bd64996a0289496'
         '0326f4909238ea1b64a28f506d14ef31')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    patch -p1 < $srcdir/0001-Fixed-compilation-errors-and-warnings-with-GCC-4.7.patch

    # C++0x support needs to be off, since Guichan is also not compiled with
    # it, leading to binary incompatibilities when using gcc 4.7.0
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_CPP0X=OFF
    make
}

package() {
   cd "$srcdir/$pkgname-$pkgver"
   make DESTDIR=${pkgdir} install
}

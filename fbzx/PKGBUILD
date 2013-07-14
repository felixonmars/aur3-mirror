# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: sausageandeggs <sausageandeggs@archlinux.us>
# Contributor: rabyte <rabyte@gmail.com>

pkgname=fbzx
pkgver=2.10.0
pkgrel=1
pkgdesc="A Sinclair ZX Spectrum Emulator, designed to work both in framebuffer and X"
arch=(i686 x86_64)
url=http://www.rastersoft.com/fbzx.html
license=(GPL3 custom)
depends=(libpulse sdl)
source=(http://www.rastersoft.com/descargas/$pkgname-$pkgver.tar.bz2)
sha256sums=('deed3d37247e4154bb10325d014461c8caf0c55ca23a611c62035e491a4f960f')
sha512sums=('b96ae4029e4ef73d15c851a54c8e057131ba6e0acf03820222aa4d4bc91e8ad497556cce41c5faef230939f1c88423e09e435f9ce91c0e0f183f6eac7843bb36')

build() {
    make -C $pkgname-$pkgver/
}

package() {
    cd $pkgname-$pkgver/
    sed -i 's:rm -f $(PREFIX2)/bin/fbzx:install -d $(PREFIX2)/bin:' Makefile
    make PREFIX="$pkgdir" install
}

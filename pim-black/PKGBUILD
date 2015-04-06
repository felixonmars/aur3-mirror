# Maintainer: Marco Kundt <mrckndt@gmail.com>

_pkgname=Pim
pkgname=pim-black
pkgver=0.6.0
pkgrel=3
pkgdesc="Python image viewer with vim-like keybindings (black background and keyboard fix)"
arch=('any')
url="https://github.com/Narrat/Pim"
license=('MIT')
depends=('python-gobject')
conflicts=('pim')
source=("pim-$pkgver.tar.gz::https://github.com/Narrat/Pim/archive/$pkgver.tar.gz"
        'color_us.patch')
sha256sums=('df6eebeb1f96e01e58fe094a002979277138ca54559101084614fe5b41981e06'
            'dcd51f09c6ca43c867fb1804b4f2b923dac1a38ec624723a682c29d3ed1709d1')
package() {
  cd "$srcdir/$_pkgname-$pkgver"

  patch -p1 -i "${srcdir}/color_us.patch"

  install -D -m755 pim $pkgdir/usr/bin/pim
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
  install -D -m644 pim.desktop "${pkgdir}/usr/share/applications/pim.desktop"
}

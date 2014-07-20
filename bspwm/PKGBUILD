# Maintainer: Bastien Dejean <nihilhill@gmail.com>

pkgname=bspwm
pkgver=0.8.9
pkgrel=3
pkgdesc='A tiling window manager based on binary space partitioning'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/baskerville/bspwm'
license=('custom:BSD')
depends=('libxcb' 'xcb-util' 'xcb-util-wm')
optdepends=('sxhkd: to define keyboard and pointer bindings' 'xtitle-git: for the example panel' 'sutils-git: for the example panel' 'bar-aint-recursive: for the example panel' 'terminus-font: for the example panel' )
provides=('bspwm')
conflicts=('bspwm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/baskerville/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('6f7967a4b64df468f2f29964b77aa9c3')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Sebastián E. Peyrott <pseus7+mpvguihs@gmail.com>
_hkgname=mpvguihs
pkgname=mpvguihs
pkgver=0.1.1
pkgrel=1
pkgdesc="A minimalist mpv GUI written in I/O heavy Haskell"
url="https://github.com/sebadoom/mpvguihs"
license=('GPL-3')
arch=('i686' 'x86_64')
depends=('mpv' 'gtk2')
makedepends=('ghc' 'haskell-gtk' 'haskell-mtl' 'haskell-x11')
provides=('mpvguihs')
conflicts=('mpvguihs-git')
install=mpvguihs.install
source=(https://github.com/sebadoom/${_hkgname}/archive/${pkgver}.tar.gz)
md5sums=('62ea5c29d3cec726c120ec8f4d85c9d8')

build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure --prefix=/usr --docdir=/usr/share/doc/${pkgname} -O
    runhaskell Setup build
}

package() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup copy --destdir=${pkgdir}

    # Icon and desktop file
    mkdir -p "$pkgdir/usr/share/applications"
    install -m 644 mpvguihs.desktop "$pkgdir/usr/share/applications"
    mkdir -p "$pkgdir/usr/share/icons/hicolor/256x256/apps"
    install -m 644 mpvguihs.png "$pkgdir/usr/share/icons/hicolor/256x256/apps"
}


# Maintainer: Gustavo Castro <gustawho[at]gmail[dot]>
pkgname=berry
pkgver=1.0.0
pkgrel=4
pkgdesc="Modern image viewer, focused on better user interface. Written in Qt5/QML2"
url="http://aseman.co/en/products/berry/"
arch=(any)
license=('GPL3')
depends=('exiv2' 'qt5-base' 'qt5-declarative' 'qt5-svg' 'qt5-multimedia' 'qt5-graphicaleffects' 'qt5-imageformats')
source=("http://aseman.co/downloads/${pkgname}/1/${pkgname}-${pkgver}-src.tar.gz"
        'Berry.desktop')
sha512sums=('06289812b6d709bc2db64b41832974a66e8a38e19efef19ef1560717dc0929639aaf912319b6eed986f4422fa273c987f17e5921024b0b155288a2509b995d6b'
            '898fd8e5391c2f58dd2c5caf11fa1b2db3978fadfe042e4f670efda74cd8c146172b45f6ff0fbbe7b6c3cbe70cf5c8dbd42f510d195babf5b9c4e068e9083488')

build() {
   cd "${srcdir}/berry"
   mkdir build && cd build
   qmake -r ..
   make
   make clean
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make INSTALL_ROOT="$pkgdir/" install
  cp -f "${srcdir}/Berry.desktop" "$pkgdir/usr/share/applications"
}

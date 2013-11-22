# Maintainer: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=syncdrive
pkgver=0.9_1
pkgrel=3
pkgdesc='Google Drive sync tool relying on grive'
arch=('x86_64' 'i386')
url='http://syncdrive.fr'
license=('proprietary')
depends=('gambas3-runtime' 'gambas3-gb-image' 'gambas3-gb-qt4' 'gambas3-gb-form' 'gambas3-gb-desktop' 'gambas3-gb-web' 'gambas3-gb-form-stock' 'gambas3-gb-sdl-sound' 'grive')
source=('http://syncdrive.fr/?wpdmact=process&did=MTkuaG90bGluaw==')
sha256sums=('86efa8e81459da8ed651dc3284f9ffffe642d34bfd96a1a78ca334836f9110bb')
if [[ "$CARCH" = 'i686' ]]; then
    source=('http://syncdrive.fr/?wpdmact=process&did=MTguaG90bGluaw==')
    sha256sums=('992691a2edfa8219dd2b3886dc2bbf370ff1e7bddba4cad82e373029a76df7d8')  
fi

package() {
    tar -xvf "${srcdir}/data.tar.gz" -C "${pkgdir}" 

    # Don't use the bundled grive binary
    rm -rf "${pkgdir}/usr/bin/grive"
}


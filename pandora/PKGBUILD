# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=pandora
pkgver=2.0.8
pkgrel=1
pkgdesc="Standalone Adobe Air Application for Pandora Radio"
arch=(any)
url=http://www.pandora.com/desktop
license=(custom)
depends=(adobe-air desktop-file-utils)
[[ $CARCH == "x86_64" ]] && depends=(adobe-air-sdk)
makedepends=(unzip)
source=($pkgname.air::http://www.pandora.com/radio/static/desktop_app/${pkgname}_${pkgver//./_}.air
    $pkgname.desktop)
noextract=($pkgname.air)
install=$pkgname.install
sha256sums=('9ac216fd51bb063f020a86c6f5d250989dfa033a2d6a3d703124c2f4bfa510d8'
    'c53d76b7afa59a82d573265b130382571ba274e3147e0ec86a065a28fcbffd53')
sha512sums=('960bf66aec420f97e203e29c30487be78de3f71925510e7f17c045335cf0c3434354fca62e58d63ebaf5f8a152c0402a66b75b3da5682a3179893c4d0ac855f9'
    'cc81493121d2e24529f1ec71f0e64fe6bf993d61a0e49785c1bf70a73ca79f4afc6e67e47128045fc92c5534a06d99dc079fd23f896f1a3f82c8f9508b575c49')

prepare() {
    unzip -o $pkgname.air
}

package() {
    install -Dm644 src/images/icon/icon-128.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
    install -Dm644 $pkgname.air "$pkgdir"/opt/$pkgname/$pkgname.air
    desktop-file-install $pkgname.desktop --dir "$pkgdir"/usr/share/applications/
}

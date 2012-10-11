# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Nathan O <ndowens.aur@gmail.com>

pkgname=seesmic-desktop
pkgver=0.8.1
pkgrel=1
pkgdesc="Get live updates from Twitter and Facebook."
arch=(any)
url=http://desktop.seesmic.com
license=(unknown)
depends=(adobe-air desktop-file-utils)
makedepends=(unzip)
source=($pkgname.air::http://d.seesmic.com/seesmic/SeesmicDesktop-$pkgver.air $pkgname.desktop $pkgname.sh)
noextract=($pkgname.air)
sha256sums=('492e3fcae78f670fd0b44f5fe1443c0d876102f55642c7360ffe73c6b8492957'
    '0fe07ed3c317f705fad4194e09276989b4a92bdc12788229a0465f5cb6c80753'
    '50e6f9057d8a0c1985d35ef2f3448412cd8e5569ec726150437ed6cd8fd6ba2a')
sha512sums=('6aca8bf9d0db997df207edba2a10bbcc586fbdbfc288b7dfdb68c98d805dd7a5ad77d56c56f7048c94c29f23234bc0f1927bf6094c8390866987db4b76145980'
    '4732ca649dfbd7ed901df5cf8b25e40b489a3697fe28c14aac85b7c9c55bd05e636e6e9fb8f0ba5ad2acd5a82d7dc0c88d550af8e4dc3101fae633b0d18c2348'
    'c5c1c4a6ca18380d198815d10ea949ff5ccfad83167d93dab9cad66296416bf5d3365ab669877858c06939704c141b934f8545045ed9d6371edee107c55dd53c')

package() {
    cd "$srcdir"

    unzip -o $pkgname.air

    install -Dm644 icons/seesmic-48.png "$pkgdir"/usr/share/pixmaps/seesmic-48.png
    install -Dm644 $pkgname.air $pkgdir/opt/$pkgname/$pkgname.air

    desktop-file-install $pkgname.desktop --dir "$pkgdir"/usr/share/applications
    install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
}

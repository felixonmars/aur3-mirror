# Maintainer: Adam Howard <howardad@gmail.com>
pkgname=ttf-camingocode
pkgver=1.0
pkgrel=1
pkgdesc="A font specially designed for source code editors from Jan Fromm"
arch=('any')
url="http://www.janfromm.de/typefaces/camingomono/camingocode/"
license=('CCPL:by-nd')
depends=('fontconfig' 'xorg-mkfontscale' 'xorg-mkfontdir')
makedepends=('unzip')
install=font.install
source=("http://janfromm.de/_data/downloads/CamingoCode-v$pkgver.zip")
noextract=("CamingoCode-v$pkgver.zip")
sha256sums=('13b188ca8d1b5fe2c3ba880771f20a6faac550405ae98d12edd46240f8896714')

prepare() {
        mkdir -p "$srcdir/$pkgname-$pkgdir"
        unzip "CamingoCode-v$pkgver.zip" -d "$srcdir/$pkgname-$pkgver"
}

package() {
        install -dm755 "${pkgdir}"/usr/share/fonts/TTF
	cd "$srcdir/$pkgname-$pkgver"
        install -Dm644 *.ttf "${pkgdir}"/usr/share/fonts/TTF/
}

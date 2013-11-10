# Maintainer: Laurent Dudouet <ldudouet at free dot fr>
pkgname=ttf-marcellus
pkgver=1.000
pkgrel=1
pkgdesc="Roman fonts with good Unicode support for latin scripts, looking like Optima with wider letters"
arch=('any')
url='http://www.1001fonts.com/marcellus-font.html'
license=('custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
makedepends=(unzip)
install=ttf.install
source=('http://dl.1001fonts.com/marcellus.zip'
        'http://dl.1001fonts.com/marcellus-sc.zip')
sha256sums=('25b4a5c539d48973bb96eb4c33140634cd21c047277ecaad533d86b928458350'
            '1f9ade16219b927aa97fa41f592a18aeb23966a2e95fab4a9082a4506e6fba11')

package() {
    cd $srcdir
    install -d "$pkgdir/usr/share/fonts/TTF"
    install -pm644 *.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

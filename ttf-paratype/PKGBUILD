# Maintainer: reflexing <reflexing@reflexing.ru>
# Contributor: Alexander Zubkov <green@msu.ru>
# Contributor: nsf
#
# Package is maintained on GitHub: https://github.com/reflexing/ttf-paratype

pkgname=ttf-paratype
pkgver=20120711
pkgrel=2
pkgdesc='Font family by ParaType: sans, serif, mono, extended cyrillic and latin, OFL license'
arch=('any')
url='http://www.paratype.com/public/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-mkfontscale' 'xorg-mkfontdir')
conflicts=('ttf-pt-mono' 'ttf-pt-sans' 'ttf-pt-serif')
provides=('ttf-font')
install="$pkgname.install"
source=(PTSerifOFL-"$pkgver".zip::http://www.fontstock.com/public/PTSerifOFL.zip
        PTSansOFL-"$pkgver".zip::http://www.fontstock.com/public/PTSansOFL.zip
        PTMonoOFL-"$pkgver".zip::http://www.fontstock.com/public/PTMonoOFL.zip)

package() {
    cd "$srcdir"

    # Prepare destination directory
    install -dm755 "$pkgdir/usr/share/fonts/TTF"

    # Install fonts
    install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF"

    # Install license
    install -Dm644 PTSansPTSerifOFL.txt "$pkgdir/usr/share/licenses/$pkgname/PTSansPTSerifOFL.txt"
}

sha256sums=('e3c6ffb9865bd25ba50d39ac4a5ba4067f65c133e848f425636b514cba52033a'
            '7105b5e7d9965b5b2fa189b5a84c66a8252b3432c0293f1350c15ad159447ee1'
            '1903ef8bca290f936bf218e258ac031575ab7da3e5fe4a2fd04eaa86a5599022')

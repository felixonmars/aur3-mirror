# Maintainer: Mike Cooper <mythmon@gmail.com>
# Original font design by Heydon Pickering <heydon@heydonworks.com>

pkgname=ttf-heydings-icons
pkgver=1.0
pkgrel=1
url="http://www.heydonworks.com/article/a-free-icon-web-font"
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="A web icons font."
arch=('any')
license=('OFL')
source=(http://www.heydonworks.com/fonts/heydings_icons.zip)
install=$pkgname.install
sha1sums=('90e1cf7a82427ea6e23a4dad28eab41a16e3a3fe')

build() {
    cd $srcdir
    mkdir -p "${pkgdir}/usr/share/fonts/TTF"
    install -Dm 644 heydings_icons.ttf $pkgdir/usr/share/fonts/TTF/heydings-icons.ttf
}

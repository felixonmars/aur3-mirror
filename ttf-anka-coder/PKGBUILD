# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>

pkgname=ttf-anka-coder
pkgver=1.100
pkgrel=1
pkgdesc="An open source monospaced font for source code and terminals by Andrey Makarov"
arch=('any')
license=('OFL')
url="http://anka-coder-fonts.googlecode.com/"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=("http://anka-coder-fonts.googlecode.com/files/AnkaCoder.$pkgver.zip"
        "http://anka-coder-fonts.googlecode.com/files/AnkaCoderCondensed.$pkgver.zip"
        "http://anka-coder-fonts.googlecode.com/files/AnkaCoderNarrow.$pkgver.zip")
md5sums=('da7bb01396b466c92e31073a27028647'
         '5b5d74bc1795f57c315a532383ee0c0f'
         '4ed9dd9fcfa020d9f9c3de3fffb2b2ad')

build() {
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 *.ttf $pkgdir/usr/share/fonts/TTF/
  install -Dm644 OFL.txt $pkgdir/usr/share/licenses/ttf-anka-coder/LICENSE
}

# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: Sebastian Wolf <fatmike303@gmail.com>
pkgname=sharpfonts-win7
_filename=fontconfig_cleartype
pkgver=1
pkgrel=1
pkgdesc="Display ClearType font rendering with Windows 7 fonts on Linux/Unix."
url="http://www.sharpfonts.co.cc"
license=("BSD")
depends=('ttf-ms-extrafonts' 'ttf-ms-fonts' 'fontconfig' 'freetype2')
install="sharpfonts-win7.install"
source=($url/$_filename.tbz)
arch=('any')

build() {
echo not a make package
}

package() {
mkdir -p $pkgdir/etc/fonts
tar xvjpf $_filename.tbz -C $pkgdir/etc/fonts/
}
sha256sums=('02bbc58946974e20474a9af257493db5881757fad50b82b93e5fd439509bd8a6')

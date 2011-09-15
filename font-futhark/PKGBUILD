# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=font-futhark
pkgver=1.1
pkgrel=1
pkgdesc="True Type Fonts for ancient norse runes"
arch=('any')
url="http://www.ancientscripts.com/futhark.html"
# http://www.arild-hauge.com/eindex.htm
# http://simplythebest.net/fonts/fonts/futhark.html
license=('freeware' 'custom')
install=ttf.install
source=('http://www.mockfont.com/old/files/runettf.zip' \
'http://simplythebest.net/fonts/fonts/font_downloads/futhark.zip')
md5sums=('ae63098448baf75cbaafa76ca63c0a24' \
'1dff0d98acad212db0a747339cfc97f9')

build() {
cd $srcdir

mkdir -p $pkgdir/usr/share/fonts/TTF/
cp $srcdir/RUNE.TTF $pkgdir/usr/share/fonts/TTF/
cp $srcdir/FUTHAI__.TTF $pkgdir/usr/share/fonts/TTF/
cp $srcdir/FUTHA___.TTF $pkgdir/usr/share/fonts/TTF/

mkdir -p $pkgdir/usr/share/licenses/$pkgname
cp $srcdir/LICENSE.TXT $pkgdir/usr/share/licenses/$pkgname/
cp $srcdir/AOEFREE.TXT $pkgdir/usr/share/licenses/$pkgname/

}


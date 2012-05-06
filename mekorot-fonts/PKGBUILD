# Maintainer: Yoel Lion <yoel3ster at gmail dot com>

pkgname=mekorot-fonts
tarname=Mekorot-Fonts
pkgver=0.03
pkgrel=1
fontname1=Vilna
fontname2=Rashi
pkgdesc="A free Hebrew 'Talmud' fonts"
arch=('any')
url="http://sourceforge.net/projects/mekorot"
license=('custom:GPL for Vila fonts; LPPL for Rashi fonts')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=('http://sourceforge.net/projects/mekorot/files/$tarname/$pkgver/$tarname-$pkgver.tar.gz/download')
md5sums=('561eb99d26a36f8e8776fe50494bd512')

build() {
  install -d $pkgdir/usr/share/fonts/TTF
  
  # Font installation
  install -m644 $srcdir/$tarname/*/*.ttf $pkgdir/usr/share/fonts/TTF
# License installation
  install -Dm644 $srcdir/$tarname/$fontname1/LICENSE $pkgdir/usr/share/licenses/$fontname1/LICENSE 
  install -Dm644 $srcdir/$tarname/$fontname2/License $pkgdir/usr/share/licenses/$fontname2/LICENSE
}

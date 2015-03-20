# Maintainer: lava <lava.mailbox@gmail.com>

pkgname=ttf-piasniar
epoch=1
pkgver=20150317
pkgrel=1
pkgdesc="Open font imitating handwriting of a belarusian writer Yanka Kupala"
arch=('any')
license=('CC-BY-SA-4.0')
url="http://piasniar.by/"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=$pkgname.install
source=(
  "http://piasniar.by/font/Piasniar_font.zip"
)

package()
{
  cd $srcdir

  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF/
}

sha384sums=('2479c0f3581243f57a21a9f38d5246d687421b857f20d6d650f826465a4023ef2b80a0f4016fc3f6fd320b77dd92531a')

# Maintainer: TuxStorm archlinux at davtek dot com 

pkgname=ttf-bruno-ace
pkgver=1.0
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Bruno Ace is a Unicode typeface family that supports languages that use the Latin script and its variants, and could be expanded to support other scripts"
arch=('any')
url="https://code.google.com/r/elranaa-fonts/source/browse/ofl/brunoace/"
license=('OFL')
source=(https://elranaa-fonts.googlecode.com/hg-history/3b74ec2a130da053429f3449b81c25a4ee19d041/ofl/brunoace/BrunoAce-Regular.ttf)
install=$pkgname.install
md5sums=('af26fd93df151f188010a4a5682a1512')

package() {
  install -dm755 "$pkgdir/usr/share/fonts/TTF/"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"
}

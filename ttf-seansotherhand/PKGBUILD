# Maintainer: Custom Processing Unlimited
# Original Contributor: Dan Serban

pkgname=ttf-seansotherhand
pkgver=1.0
pkgrel=1
depends=(fontconfig xorg-font-utils)
pkgdesc="Sean's Other Hand font"
arch=(any)
license=(custom)
url="http://www.dafont.com/seans-other-hand.font"
install=ttf-seansotherhand.install

build()
{
  wget -O seans_other_hand.zip "http://img.dafont.com/dl/?f=seans_other_hand"
  bsdtar -xf seans_other_hand.zip SeanHand.ttf
  install -Dm644 SeanHand.ttf "${pkgdir}"/usr/share/fonts/TTF/SeanHand.ttf
}


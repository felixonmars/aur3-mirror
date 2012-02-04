# Maintainer: Dan Serban

pkgname=ttf-handofsean
pkgver=1.0
pkgrel=1
depends=(fontconfig xorg-font-utils)
pkgdesc="Sean's handwriting"
arch=(any)
license=(custom)
url="http://www.dafont.com/hand-of-sean.font"
install=ttf-handofsean.install

build()
{
  wget -O hand_of_sean.zip "http://img.dafont.com/dl/?f=hand_of_sean"
  bsdtar -xf hand_of_sean.zip handsean.ttf
  install -Dm644 handsean.ttf "${pkgdir}"/usr/share/fonts/TTF/handofsean.ttf
}


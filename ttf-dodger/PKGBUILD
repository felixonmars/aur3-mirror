# Maintainer: Custom Processing Unlimited
# Original Contributor: Dan Serban

pkgname=ttf-dodger
pkgver=1.0
pkgrel=1
depends=(fontconfig xorg-font-utils)
pkgdesc="Dodger font"
arch=(any)
license=(custom)
url="http://www.dafont.com/dodger.font"
install=ttf-dodger.install

build()
{
  wget -O dodger.zip "http://img.dafont.com/dl/?f=dodger"
  bsdtar -xf dodger.zip Dodgv2.ttf
  install -Dm644 Dodgv2.ttf "${pkgdir}"/usr/share/fonts/TTF/Dodgv2.ttf
}


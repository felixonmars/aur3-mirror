# Maintainer: Tomasz P. <tmszppATgmailDOTcom>
pkgname=xfce-theme-greybird-mac
pkgver=1.0
pkgrel=2
pkgdesc="A theme for Xfce by otraviejaloca, a fusion between CratOS-lion and Greybird"
arch=(any)
url="http://xfce-look.org/content/show.php/Greybird-Mac?content=149800"
license=('GPL')
depends=(gtk-engine-murrine)
source=(http://dl.dropbox.com/u/65441554/Greybird-Mac.tar.gz)
md5sums=('55e509adcb8c08335c0b050d4f87709b')

build() {
  cd "$srcdir"
}

package() {
  cd "$pkgdir"
  install -d -m755 usr/share/themes
  mv "$srcdir/Greybird-Mac" usr/share/themes
}


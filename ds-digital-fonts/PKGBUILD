# Contributor: H.Gökhan SARI
pkgname=ds-digital-fonts
pkgver=0.1
pkgrel=1
pkgdesc="A truetype font which is perfect for using with digital clock."
arch=(any)
url="http://www.dafont.com/ds-digital.font"
license=('GPL')
source=(ds_digital.zip)
md5sums=('d4b7aea7106cc00daef73d51eeda826c')

build() {
  mkdir -p $pkgdir/usr/share/fonts/TTF/
  cp $srcdir/*.TTF $pkgdir/usr/share/fonts/TTF/
}

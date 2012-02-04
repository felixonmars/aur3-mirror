pkgname=websitebaker
pkgver=2.8.2
pkgrel=1
pkgdesc="Website Baker is a PHP-based Content Management System (CMS) designed with one goal in mind: to enable its users to produce websites with ease."
arch=('i686' 'x86_64')
url="http://www.websitebaker2.org/"
license=('GPL')
source=(http://www.websitebaker2.org/media/download_gallery/WebsiteBaker_$pkgver.zip)
md5sums=('c42e9341a1aca1670c1d9529bd723836')

build() {
  mkdir -p $pkgdir/srv/http/$pkgname
  cd $srcdir
  rm *.zip # removes the softlink to the zipfile
  cp -r * $pkgdir/srv/http/$pkgname
}

# Contributor: H.Gokhan SARI <hsa2@difuzyon.net>
pkgname=wxyzv
pkgver=2
pkgrel=1
pkgdesc="A minimalist image viewer."
arch=(i686)
url="http://sourceforge.net/projects/wxyzv2/"
license=('GPL')
source=('http://heanet.dl.sourceforge.net/sourceforge/wxyzv2/wxyzv-2.0-beta-6.tar.gz')
md5sums=('3ac87a41fd96261cb8af3993801bf9be')

build() {
  cd $startdir/src/$pkgname-2.0-beta-6
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}

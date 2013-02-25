_pkgname=adms-xml
pkgname=$_pkgname-github
pkgver=9719436b0e
pkgrel=1
pkgdesc="ADMS XML Package"
arch=('i686' 'x86_64')
url="https://github.com/upverter/ADMS"
license=('GPL')
depends=('perl-xml-libxml')
makedepends=('git')
conflicts=($_pkgname)


build() {
  git clone https://github.com/upverter/ADMS.git
  cd ADMS
  ./configure --enable-maintainer-mode --prefix=/usr
  make
  make DESTDIR=$pkgdir install
}
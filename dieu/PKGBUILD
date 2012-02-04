# Contributor: Javier ‘Phrodo_00’ Aravena <Phrodo.00@gmail.com>
pkgname=dieu
pkgver=0.5.4
pkgrel=2
pkgdesc="Social bookmarking tool for GNOME"
arch=('i686')
url="http://code.google.com/p/dieu/"
license=('GPL')
depends=('pygtk' 'python-pysqlite')
source=("http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('cfc8a79b428437bc3ef554e044eda215')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}

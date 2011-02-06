# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=adeona  
pkgver=0.2.1
pkgrel=4
pkgdesc="System for tracking the location of your lost or stolen laptop "
url="http://adeona.cs.washington.edu"
arch=('i686' 'x86_64')
depends=('openssl')
license=('GPL2')
source=("http://adeona.cs.washington.edu/packages/$pkgname-$pkgver.tar.gz")
md5sums=('0f33cf38190d8c539e1a2d3313ca7799')
build() {
  cd $srcdir/$pkgname
  ./configure --prefix=/usr/$pkgname || return 1
  install -d $pkgdir/usr/share/$pkgname/{resources,logs} || return 1
  sed -i 's+/usr/local+\$pkgdir/usr/share+' \
    scripts/installadeona.sh || return 1
  make || return 1
  yes | make pkgdir=$pkgdir install || return 1
}

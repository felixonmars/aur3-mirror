# Contributor: Nathan Owe <ndowens04 at gmail>
pkgname=tacshell
pkgver=0.91
pkgrel=1
pkgdesc="a drop-in replacement for the RSA ACE/Server sdshell program"
arch=('i686' 'x86_64')
url="http://www.rezrov.net/software/tacshell.html"
license=('GPL')
depends=('glibc')
install=tacshell.install
source=(http://www.rezrov.net/software/$pkgname-$pkgver.tar.gz)
md5sums=('6cad05a93aa3f56cafd8b6d4eb48684a') 

build() {
  cd $srcdir/$pkgname-$pkgver
 install -d $pkgdir/usr/bin $pkgdir/usr/share/$pkgname || return 1
  ./configure  --prefix=$pkgdir/usr 
  make || return 1
  make  DESTDIR=$pkgdir/ install || return 1
rm -rf $pkgdir/usr/etc || return 1
install -Dm644 tacshell.conf-example $pkgdir/usr/share/$pkgname/tacshell.conf-example

}

# vim:set ts=2 sw=2 et:

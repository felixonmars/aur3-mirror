# Contributor: Nathan Owe <ndowens04 at gmail>
pkgname=fspclient
pkgver=0.92.0
pkgrel=1
pkgdesc="FTP-like interface for File Service Protocol"
arch=('i686' 'x86_64')
url="http://fspclient.sourceforge.net/"
license=('BSD')
depends=('glibc')
install=fspclient.install
source=(http://downloads.sourceforge.net/fspclient/$pkgname-$pkgver.tar.gz)
md5sums=('9690ab49545c013b35951f1a3b5be4f0') 

build() {
  cd $srcdir/$pkgname-$pkgver
  scons prefix=$pkgdir/usr DESTDIR=$pkgdir/ install || return 1
  rm -r $pkgdir/usr/man || return 1
  install -d $srcdir/man/fsp.1 $pkgdir/usr/share/man 
  install -d $srcdir/README $pkgdir/usr/share/licenses/$pkgname
  install -dm755 $srcdir/fsprc $pkgdir/usr/share/$pkgname/.fsprc
}

# vim:set ts=2 sw=2 et:

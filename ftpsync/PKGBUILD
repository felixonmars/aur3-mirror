pkgname=ftpsync
pkgver=1.3.06
pkgrel=1
pkgdesc="A Perl script to synchronize a local directory tree and a remote FTP directory tree"
arch=(any)
url="https://www.clazzes.org/projects/ftpsync/"
license=('GPL')
depends=(perl libnet perl-libwww)
source=(http://download.clazzes.org/ftpsync/$pkgname-$pkgver-0.tar.bz2)
md5sums=('b451aefe6101cf54611b9933427264b0')

build() {
  cd $srcdir/$pkgname-$pkgver-0
  install -d $pkgdir/usr/{bin,share/ftpsync}
  install -m755 ftpsync.pl $pkgdir/usr/bin/ftpsync
}

# Maintainer: Valère Monseur <valere dot monseur at ymail dot com>

pkgname=logsurfer
pkgver=1.8
pkgrel=1
pkgdesc="A real-time log monitoring and alerting system"
arch=('i686' 'x86_64')
url="http://www.crypt.gen.nz/logsurfer/index.html"
license=('Custom')
depends=('glibc')
backup=('etc/logsurfer.conf')
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('2c9a07895f9613a38013bf3706b235f3')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --with-etcdir=/etc
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  install -d -m755 $pkgdir/etc
  touch $pkgdir/etc/$pkgname.conf

  install -D -m755 src/$pkgname $pkgdir/usr/bin/$pkgname
  install -D -m644 man/$pkgname.1 $pkgdir/usr/share/man/man1/$pkgname.1
  install -D -m644 man/$pkgname.conf.4 $pkgdir/usr/share/man/man4/$pkgname.conf.4
  install -D -m644 DISCLAIMER $pkgdir/usr/share/licenses/$pkgname/DISCLAIMER
}

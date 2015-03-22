# Contributor: Lex Black <autumn-wind at web dot de>
# Maintainer: Jan GUTH <prometheus@c3l.lu>

pkgname=yafc
pkgver=1.3.5
pkgrel=2
pkgdesc="Yet Another FTP Client for the console"
arch=('i686' 'x86_64')
url="http://yafc-ftp.com/"
license=('GPL')
depends=('libbsd')
makedepends=('krb5' 'readline' 'libssh')
optdepends=("krb5: required for Kerberos 5 support"
            "readline: required for tab completion and history support"
            "libssh: required for scp and sftp support")
source=(http://yafc-ftp.com/upload/$pkgname-$pkgver.tar.xz{,.asc})
sha512sums=('89ff4791356daf4978a2fe5dfb7dc54205be2c22a1061b928ec2a5b01728df0799c063592de482f359638ba5496ac860228dd8f289bb9b75e3ab4ba6841d15cf'
            'SKIP')
validpgpkeys=('F78CBA07817BB149A11D339069F2FC516EA71993') # Sebastian Ramacher


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

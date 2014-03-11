# Maintainer: Paul Dann <pdgiddie\at/gmail.com>

pkgname=pam_krb5
pkgver=2.4.9
pkgrel=1
pkgdesc="Kerberos authentication for PAM, with AFS support"
arch=('i686' 'x86_64')
url="https://fedorahosted.org/pam_krb5"
license=('GPL')
depends=('krb5')
source=("https://fedorahosted.org/releases/p/a/pam_krb5/${pkgname}-${pkgver}.tar.gz")
md5sums=('b8a37cd2c80aeec1ef20238720d0119c')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# Contributor: Roberto Alsina <ralsina@kde.org>
pkgname=checkpassword-pam
pkgver=0.99
pkgrel=4
pkgdesc="An implementation of checkpassword-compatible authentication program."
url="http://checkpasswd-pam.sourceforge.net/"
license=("GPL")
depends=('pam')
arch=('i686')
source=(http://downloads.sourceforge.net/sourceforge/checkpasswd-pam/$pkgname-$pkgver.tar.gz)
md5sums=('47db7b71f281115b030d4947f09f4374')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}

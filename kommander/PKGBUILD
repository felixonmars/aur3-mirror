# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Previous Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=kommander
pkgver=1.3.1
pkgrel=1
pkgdesc="Easy to use solution to create KDE applications without programming"
url="http://kommander.kdewebdev.org/"
license=('GPL')
arch=('i686' 'x86_64') 
depends=('kdelibs')
conflicts=('kdewebdev' 'kdemod-kdewebdev-kommander')
source=("http://$pkgname.kdewebdev.org/files/$pkgname-$pkgver.tar.bz2")
md5sums=('4d4bc13ec770ccd31c772442daf688b2')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/opt/kde
  make || return 1
  make DESTDIR="$pkgdir" install
}

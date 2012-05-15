pkgname=gnopaste
pkgver=0.5.5
pkgrel=2
pkgdesc="gnopaste is a free nopaste script based on PHP with MySQL."
license=('GPL')
arch=('i686' 'x86_64')
url="http://gnopaste.sourceforge.net/"
depends=('php' 'mysql')
backup=(usr/share/webapps/gnopaste/config.php)
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tgz)
md5sums=('d213b9f48bb545f22685b93838d550ab')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/share/webapps/gnopaste"
  cp -ra * "$pkgdir/usr/share/webapps/gnopaste"
}

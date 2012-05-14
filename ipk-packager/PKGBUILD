# Maintainer: Jakub Kozisek <nodevel at gmail dot com>

pkgname=ipk-packager
pkgver=1.6
pkgrel=1
pkgdesc="IpkPackager: Cross-Platform webOS Ipk Packager"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ipk-packager/"
license=('MIT')
depends=('jre>=6')
source=("http://ipk-packager.googlecode.com/files/Ipk%20Packager.jar"
        'ipk-packager')
sha1sums=('d6459a34e1bdc65383d99b518b1272a5ef593324'
	  '76f3ac1143cd59600bca93fb64f65da3050d3e6c')

package() {
  cd $startdir
  msg "Packaging"
  install -D -m644 Ipk%20Packager.jar "$pkgdir/usr/share/$pkgname/IpkPackager.jar" || return 1
  mkdir "$pkgdir/usr/share/$pkgname/Installer" || return 1
  install -D -m755 $pkgname "$pkgdir/usr/bin/$pkgname" || return 1
}
# Contributor: said

pkgname=qviaggiatreno
pkgver=2012.9
pkgrel=1
pkgdesc="Un'applicazione per controllare gli orari dei treni in tutta Italia tramite il sito viaggiatreno.it."
arch=('i686' 'x86_64')
url="http://xp-dev.com/sc/browse/3525/?rev=-2"
license=('GPL2')
depends=('qt')
source=(qviaggiatreno-2012.9.zip)
md5sums=('35fb011065549c4efab3aef87b262887')
build() {
  cd $srcdir/$pkgname-$pkgver
  qmake
  make 
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm755 bin/$pkgname $pkgdir/usr/bin/$pkgname
}

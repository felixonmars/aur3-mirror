# Contributor: Blaž Tomažič <blaz.tomazic@gmail.com>

pkgname=cryosleep
pkgver=0.2
pkgrel=2
pkgdesc="The Cryosleep program generates changing noisewaves with a superimposed brainwave that are nice to listen to and vary over time"
arch=('i686')
url="http://cryosleep.yellowcouch.org/index.html"
license=('GPL')
depends=('qt4' 'alsa-lib' 'fftw')
source=(ftp://cryosleep.yellowcouch.org/cryosleep/$pkgname-$pkgver.source.tgz
        defines.patch)
md5sums=('795e82a437e21f22ad115cde689b40f1'
         '44b65210c515d22df7e4fb76edfe4598')


prepare() {
  cd "$srcdir/$pkgname-$pkgver"	

  patch defines ../defines.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"	

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"	
  
  mkdir -p $pkgdir/usr/share/$pkgname/tubes
  install -m644 tubes/* -t ../../pkg/usr/share/$pkgname/tubes
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:

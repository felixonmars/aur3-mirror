# Maintainer: David Manouchehri <d@32t.ca>

pkgname=virtual-magnifying-glass
pkgver=3.5
pkgrel=1
pkgdesc="Virtual Magnifying Glass is designed for visually-impaired and others who need to magnify a part of the screen. Run vmg to start."
arch=('i686' 'x86_64')
url="http://magnifier.sourceforge.net/"
license=('GPL2')
makedepends=('lazarus' 'fpc')
source=("http://sourceforge.net/projects/magnifier/files/magnifier%20for%20Linux/$pkgver/magnifier-linux-$pkgver.tar.bz2")
sha512sums=('6422ee24c34b1e2a45aa55c7828ea3b8beeef27aa31b9c95b198e09e2fa5bd49b86f0a7e6bddd4ca15414022289fe035763e9908b65b8f94a36289056d7894e6')

package() {
  cd $srcdir/magnifier-linux-$pkgver
  ./install.sh DESTDIR=$pkgdir  
}

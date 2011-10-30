#UMADE - PKGBUILD
#Maintainer: Marek Strelec <marek.strelec@gmail.com>

pkgname=umade
pkgver=0.1
pkgrel=1
pkgdesc="A small utility for easy application launching"
arch=('any')
url="http://sourceforge.net/projects/umade/"
license=('GPL')
depends=('python3' 'imagemagick' 'libjpeg' 'libpng')
source=(http://sourceforge.net/projects/umade/files/UMADE-${pkgver}/UMADE-${pkgver}.tar.gz)
sha256sums=('42ef73979c99b187b38e5fe595fad1f37911c1eb11e6f81c360836db9044c3a3')

package() {
  true
}

package() {
  mkdir -p "$pkgdir/usr/share/umade"
  mkdir -p "$pkgdir/etc/umade"
  mkdir -p "$pkgdir/usr/sbin"
  
  mv $srcdir/UMADE-$pkgver/img/* "$pkgdir/usr/share/umade"
  mv "$srcdir/UMADE-$pkgver/profile.conf" "$pkgdir/etc/umade"
  mv "$srcdir/UMADE-$pkgver/counter.conf" "$pkgdir/etc/umade"
  mv "$srcdir/UMADE-$pkgver/umade.py" "$pkgdir/usr/sbin/umade"
  
  chmod a+rwx -R $pkgdir/usr/share/umade
  chmod a+rwx -R $pkgdir/etc/umade
  chmod a+rx -R $pkgdir/usr/sbin/umade
  
}


# vim:set ts=2 sw=2 et:


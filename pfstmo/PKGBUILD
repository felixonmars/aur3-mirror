#Maintainer: Jochen Keil <jochen dot keil at gmail dot com>
#Contributor: Brandon Andrews <bsa at bsa dot isa-geek dot com>
#Contributor: Christophe-Marie Duquesne <chmd@chmd.fr>
pkgname=pfstmo
pkgver=1.5
pkgrel=1
pkgdesc='The implementation of state-of-the-art tone mapping operators'
arch=('i686' 'x86_64')
url='http://pfstools.sourceforge.net/pfstmo.html'
license=('GPL2')
depends=('pfstools' 'fftw' 'gsl')
source=("http://downloads.sourceforge.net/pfstools/$pkgname-$pkgver.tar.gz")
md5sums=('f0dc0baee2be66b1eedf77a45864c0e9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:

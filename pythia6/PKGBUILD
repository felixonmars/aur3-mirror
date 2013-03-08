# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: T.Cunly

pkgname=pythia6
pkgver=6.4.27
pkgrel=1
pkgdesc='An event generator for a large number of physics processes.'
arch=('i686' 'x86_64')
url='http://home.thep.lu.se/~torbjorn/Pythia.html'
license=('LGPL')
depends=('gcc-fortran')
makedepends=('p7zip')
source=("http://www.hepforge.org/archive/pythia6/pythia-${pkgver}.f.gz")
md5sums=('4f11603ead7be9978c82a8fc177c044f')

build() {
    rm -f *.so *.o *.a *.f
    
    7z x pythia-$pkgver.f.gz

    gfortran -c -fPIC *.f

    ar crv libPythia6.a *.o
    gfortran -shared -fPIC *.o -o libPythia6.so
}

package() {
    install -D -m644 libPythia6.a ${pkgdir}/usr/lib/libPythia6.a
    install -D -m644 libPythia6.so ${pkgdir}/usr/lib/libPythia6.so

    ln -s /usr/lib/libPythia6.a ${pkgdir}/usr/lib/libpythia.a
    ln -s /usr/lib/libPythia6.so ${pkgdir}/usr/lib/libpythia.so
}

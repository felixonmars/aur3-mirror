pkgname=shtns
pkgver=2.5
_pkgrev=2.5-r493
pkgrel=1
pkgdesc="high performance library for Spherical Harmonic Transform"
arch=(i686 x86_64)
url="https://bitbucket.org/nschaeff/shtns"
license=('CeCILL')
depends=('python-numpy' 'fftw')
source=("https://bitbucket.org/nschaeff/shtns/downloads/shtns-${_pkgrev}.tar.gz")
md5sums=('4706f15ce72ebbb0c9d8f9ec6d48bee2')

build() {
  cd "$srcdir"
  cp -a ${pkgname}-${_pkgrev}{,-py}

  cd "$srcdir"/${pkgname}-${_pkgrev}
  ./configure --prefix=/usr --enable-openmp

  sed -i "s/CFLAGS=/CFLAGS=$CFLAGS -fPIC /g" Makefile

  make
  gcc -shared -o libshtns_omp.so  -Wl,--whole-archive libshtns_omp.a -Wl,--no-whole-archive

  cd "$srcdir"/${pkgname}-${_pkgrev}-py
  ./configure --prefix=/usr --enable-openmp --enable-python

  sed -i "s/CFLAGS=/CFLAGS=$CFLAGS -fPIC /g" Makefile
  sed -i "s|setup.py install|setup.py install --root ${pkgdir} --optimize 1|g" Makefile

  make
}

package() {
  cd "$srcdir/${pkgname}-${_pkgrev}"
  make DESTDIR="${pkgdir}" PREFIX="${pkgdir}"/usr install
  install "$srcdir/${pkgname}-${_pkgrev}"/libshtns_omp.so "${pkgdir}"/usr/lib

  cd "$srcdir/${pkgname}-${_pkgrev}-py"
  make DESTDIR="${pkgdir}" install
}

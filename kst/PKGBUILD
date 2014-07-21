# Maintainer: Maximilian Stein <theoddbird@posteo.org>
# Contributor: Joshua N. <drmrshdw@gmail.com>
# Contributor: Vit <vitruss@gmail.com>
# Contributor: Giulio Guzzinati <skarn86junk@gmail.com>

pkgname=kst
pkgver=2.0.8
pkgrel=1
pkgdesc="Fast real-time large-dataset viewing and plotting tool for KDE"
arch=('i686' 'x86_64')
url="http://kst.kde.org"
license=('GPL')
depends=('gsl' 'qt4' 'muparser' 'python2-scipy' 'cfitsio' 'netcdf-cxx-legacy')
optdepends=(
  'getdata: provides support for files in the Dirfile format'
  'libmatio: provides support for Matlab binary files'
)
makedepends=('cmake')
install=$pkgname.install
source=(http://downloads.sourceforge.net/project/kst/Kst%20${pkgver}/Kst-${pkgver}.tar.gz)
md5sums=('6f52c16edb63e8980520bfdaebed3eae')

build() {
  cd "$srcdir/Kst-$pkgver/src/images"
  cd "$srcdir/Kst-$pkgver"
  sed -i "s/find_package\(PythonLibs REQUIRED\)/SET \(PythonLibs \"\/usr\/lib64\/libpython2.7.so\"\)/" \
  ./cmake/pyKst/CMakeLists.txt
  sed -i "s/python/python2/" \
  ./cmake/pyKst/finddistdir.py
  sed -i "s/\${NUMPY_VERSION_PATCH}/0/" \
  ./cmake/modules/FindNumPy.cmake
  cp -r ./cmake/pyKst/* ./pyKst/
  cmake ./ \
  -Dkst_release=1 \
  -Dkst_version_string=1 \
  -Dkst_svnversion=0 \
  -Dkst_python=1 \
  -DPYTHON_EXECUTABLE=/usr/bin/python2.7 \
  -Dkst_python_prefix=/usr/lib/python2.7 \
  -Dkst_install_prefix=/usr/
}
package() {
  cd "$srcdir/Kst-$pkgver"
  make DESTDIR="${pkgdir}" install
}
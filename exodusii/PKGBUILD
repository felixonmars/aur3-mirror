# Contributor: Andrew Fischer <andrew_at_lightningtoads.com>

pkgname=exodusii

# The sourceforge bundle dropped the ii
_pkgname=exodus

pkgver=6.06

# The sourceforge package sometimes has -X, which we can't do in aur
_pkgver=6.06

pkgrel=1
pkgdesc="EXODUS II is a model format developed to store and retrieve transient data for finite element analyses."
arch=('i686' 'x86_64')
license=("BSD")
url="http://sourceforge.net/projects/exodusii"
depends=('cmake' 'netcdf-fortran' 'hdf5')
source=("http://downloads.sourceforge.net/project/exodusii/$_pkgname-$_pkgver.tar.gz")
md5sums=('cfd240dbc1251b08fb1d0ee2de40a44c')

package() {
  cd $srcdir/$_pkgname-$pkgver/$_pkgname || return 1

  _kernelver=$(eval 'uname -r')

  mkdir -p build-$_kernelver && cd build-$_kernelver || return 1

  # Exodusii cmake wants the NETCDF_DIR environment variable
  NETCDF_DIR=/usr cmake \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DBUILD_SHARED:BOOL=ON \
	-DPYTHON:BOOL=OFF \
    ..

  # Supress warnings by creating a non-existent include dir for the build
  mkdir -p forbind/include || return 1

  make || return 1
  make DESTDIR=$pkgdir install || return 1
}









# Contributor: Jerome Berger <jeberger@free.fr>

# IMPORTANT: There is currently a bug in llvm-config which prevents this package from building properly.
# if you want to build this package, you will need to apply the provided patch to llvm-config.
pkgname=clay-hg
pkgver=2963
pkgrel=1
pkgdesc="Clay is a programming language designed for Generic Programming."
arch=(i686 x86_64)
url="http://tachyon.in/clay/"
license="BSD"
depends=('llvm')
makedepends=('mercurial' 'cmake')
options=('!libtool' '!emptydirs')
source=(llvm-config.patch)
md5sums=('60c8256765093fc49710caf50e0262cb')

_hgroot=http://bitbucket.org/kssreeram
_hgrepo=clay

build() {
   cd $srcdir/$_hgrepo

   rm -rf build
   mkdir build
   cd build
   cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=/usr ../
   make
}

package() {
   cd $srcdir/$_hgrepo/build
   make DESTDIR=$pkgdir install
}

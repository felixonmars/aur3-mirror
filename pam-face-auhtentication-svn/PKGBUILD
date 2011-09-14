# Contributor: Carlos RH Ruiz <ruizh.cj@gmail.com>
pkgname=pam-face-authentication-svn
pkgver=20110914
pkgrel=1
pkgdesc="PAM face authentication module"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pam-face-authentication"
license=('GPL')
#groups=()
depends=('pam' 'opencv' 'libx11' 'qt')
makedepends=('svn' 'cmake')
provides=('pam-face-authentication')
conflicts=('pam-face-authentication')
#replaces=()
#backup=()
#install=
source=('OpenCVConfig.cmake'::'https://code.ros.org/svn/opencv/trunk/opencv/OpenCVConfig.cmake.in')
#noextract=()
sha256sums=('fe91e5ad938cbbaf643997775f44b2a9988c851b70c209d7929521b9e5364d60')
_svnroot='http://pam-face-authentication.googlecode.com/svn/'
_svnname='pam-face-authentication'
build() {
  cd "${srcdir}"
  mv ../svn.diff ./
  msg "Cloning subversion repo..."
  svn co ${_svnroot} ${_svnname} || return 1
  cd ${_svnname}
  msg "Patching..."
  rm trunk/qtbranch/cmake/modules/FindOpenCV.cmake || return 1 #See issue 75 in Google Code.
  mv ${srcdir}/OpenCVConfig.cmake ${srcdir}/${_svnname}/trunk/qtbranch/cmake/modules/OpenCVConfig.cmake || return 1
  patch -p0 < ${srcdir}/svn.diff || return 1
}

package() {
  cd ${srcdir}/${_svnname}/trunk/qtbranch
  cmake -D CMAKE_INSTALL_PREFIX=/usr . || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}
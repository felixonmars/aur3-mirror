# Contributor: Carlos RH Ruiz <ruizh.cj@gmail.com>
pkgname=pam-face-authentication-noverbose
_pkgname=pam-face-authentication
pkgver=0.3
pkgrel=5
pkgdesc="PAM face auth. Removed too much verbosity"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pam-face-authentication"
license=('GPL')
#groups=()
depends=('opencv>=2.3' 'qt')
makedepends=('cmake')
#provides=()
conflicts=('pam-face-authentication' 'pam-face-authentication-svn')
#replaces=()
#backup=()
#install=
source=('http://pam-face-authentication.googlecode.com/files/pam-face-authentication-0.3.tar.gz' 'pam_face_authentication.cpp.diff')
#noextract=()
sha256sums=('24cec1adb649a809fba4a131111df0de5701d8b0ee0b3295c6a80d97f6ddec64' 'd5a310c1c8032d83aa1d9c4cd212491cc3e30a51707d88c75bd420e7300acffd')

build() {
  cd "$srcdir"/${_pkgname}-$pkgver
  
  # Fix for OpenCV 2.3
  rm cmake/modules/FindOpenCV.cmake
  cp /usr/share/opencv/OpenCVConfig.cmake cmake/modules
  sed -i 's/OPENCV_LIBRARIES/OpenCV_LIBS/g' CMakeLists.txt
  
  # Remove unwanted verbosity
  patch src/pam_face_authentication.cpp $srcdir/pam_face_authentication.cpp.diff
  
  cmake -D CMAKE_INSTALL_PREFIX=/usr . || return 1
}

package() {
  cd ${srcdir}/${_pkgname}-$pkgver
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}

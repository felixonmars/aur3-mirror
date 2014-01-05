# submitter: perlawk
# Maintainer: perlawk

pkgname=opencv-c
_pkgname=opencv
pkgver=1.0.0
pkgrel=1
pkgdesc="OPENCV 1.0, for those use C API and programming languages support C FFI only."
url="http://www."
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('swig' 'libpng12')
conflicts=('opencv')
install=
source=("http://nchc.dl.sourceforge.net/project/opencvlibrary/opencv-unix/1.0/opencv-1.0.0.tar.gz"
"opencv.patch")

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"/cxcore
	patch -p0 -i "$startdir"/opencv.patch
} 

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
	CFLAGS=-I/usr/include/libpng12 LDFLAGS=-lpng12 ./configure --prefix=/usr --with-swig --with-gtk --with-png12 --without-v4l --without-python
	for m in $(find . -iname "Makefile" -exec egrep png16 {} -l \; 2>/dev/null); do
	sed -i 's/png16/png12/;' $m ; done
  make -j4
}
 
package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
md5sums=('146a05005f2d2c16c4ee10ebd7f1dd58'
         'd0ac783af6b71e828bc3300994044512')

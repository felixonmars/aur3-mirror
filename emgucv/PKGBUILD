# Maintainer: Seb <sebcactus at gmail dot com>

pkgname=emgucv
pkgver=2.4.2
pkgrel=1
pkgdesc="Emgu CV is a cross platform .Net wrapper to the OpenCV image processing library"
arch=('x86_64')
url="http://www.emgu.com/"
license=('GPL' 'BSD')
conflicts=('opencv' 'tesseract-data-eng')
provides=('opencv=2.4.2')
depends=('mono' 'libgeotiff' 'gstreamer0.10-base' 'gtk2' 'jasper' 'libdc1394' 'openexr' 'v4l-utils' 'xine-lib' 'intel-tbb' 'tesseract')
optdepends=('eigen3' 'python2-numpy')
makedepends=('git' 'cmake')
source=()

_gitroot=git://emgucv.git.sourceforge.net/gitroot/emgucv
_gitmod=emgucv
_cmakeopts=('-D CMAKE_BUILD_TYPE=Release'
						'-D CMAKE_INSTALL_PREFIX=/usr'
						'-D CMAKE_SKIP_RPATH=ON'
						'-D ENABLE_SSE3=OFF'
						'-D BUILD_PERF_TESTS=OFF'
						'-D BUILD_TESTS=OFF'
						'-D BUILD_DOCS=OFF'
						'-D WITH_TBB=ON'
						'-D WITH_CUDA=OFF'
						'-DEMGU_CV_EXAMPLE_BUILD=OFF')


build() {
  cd "$srcdir"
	[ $CARCH = x86_64 ] && \
	  _cmakeopts=${_cmakeopts[@]/ENABLE_SSE3=OFF/ENABLE_SSE3=ON}
	if [[ ! -d $pkgname-$pkgver ]]; then
		git clone $_gitroot/$_gitmod $pkgname-$pkgver;
		cd $pkgname-$pkgver;
  	git checkout tags/$pkgver
		git submodule init;
		git submodule update;
		# Patch OpenCV
		cd opencv_attic
		git apply --reject --whitespace=fix ../miscellaneous/0001-patch-opencv-for-emgucv.patch
		cd ../..
	fi;
	cd $pkgname-$pkgver
  cmake ${_cmakeopts[@]} ../$pkgname-$pkgver
	make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  # Fixes opencv library location
	mv "$pkgdir"/usr/bin/lib* "$pkgdir"/usr/lib/
  # Fixes xml file
	_newpath="/usr/lib/cli/$pkgname-${pkgver:0:3}"
  for file in "${pkgdir}${_newpath}/*.xml"; do
		sed -i "s|$srcdir/$pkgname-$pkgver/bin|${_newpath}|g" $file;
  done
	# Change location of tesseract data
	mv "$pkgdir"/usr/bin/tessdata "$pkgdir"/usr/share/
	# Add opencv license
	install -Dm644 "$srcdir/$pkgname-$pkgver/opencv_attic/opencv/doc/license.txt" \
	  "$pkgdir/usr/share/licenses/opencv/LICENSE"
	# Remove GPL license
	rm -r "$pkgdir"/usr/lib/3rdParty
}

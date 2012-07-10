# Maintainer: CHEN Xing <cxcxcxcx@gmail.com>
# Contributor: Martin Imobersteg <martin.imobersteg@gmail.com>
# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>

pkgname=opencv-svn
pkgver=8986
pkgrel=1
pkgdesc="Collection of algorithms, documentation and sample code for real time computer vision."
url="http://sourceforge.net/projects/opencvlibrary"
license=("BSD")
arch=(i686 x86_64)
depends=('jasper' 'gstreamer0.10-base' 'openexr'
         'gtk2' 'xine-lib' 'libdc1394' 'v4l-utils' 'qt' 'bash')
makedepends=('pkg-config' 'cmake' 'python2-numpy' 'eigen2' 'python2-sphinx')
optdepends=(
            'eigen2'
            'python2-numpy: Python 2.x interface')
conflicts=('opencv' 'opencv-docs' 'opencv-samples')
provides=('opencv' 'opencv-docs' 'opencv-samples')
options=('!libtool')

source=()
md5sums=()

depends=('gstreamer0.10' 'jasper' 'openexr' 'ffmpeg' 'v4l-utils' 'eigen' 'xine-lib')
makedepends=('subversion' 'cmake' 'python2' 'python2-numpy' 'doxygen')

_svntrunk=http://code.opencv.org/svn/opencv/trunk/
_svnmod=opencv/

_cmakeopts=('-D CMAKE_BUILD_TYPE=Release'
            '-D CMAKE_INSTALL_PREFIX=/usr'
            '-D PYTHON_EXECUTABLE=/usr/bin/python2'
            '-D CMAKE_SKIP_RPATH=ON'
            '-D BUILD_TESTS=OFF'
            '-D ENABLE_SSE=ON'
            '-D ENABLE_SSE2=ON'
            '-D ENABLE_SSE3=ON'
            '-D ENABLE_SSSE3=ON'
            '-D ENABLE_SSE41=ON'
            '-D ENABLE_SSE42=ON'
            '-D BUILD_EXAMPLES=ON'
            '-D INSTALL_C_EXAMPLES=ON'
            '-D INSTALL_PYTHON_EXAMPLES=ON'
            '-D WITH_XINE=ON'
            '-D WITH_QT=ON'
            '-D WITH_QT_OPENGL=OFF'
            '-D WITH_UNICAP=OFF'
            '-D WITH_PVAPI=OFF'
            '-D WITH_OPENNI=OFF'
            '-D WITH_TBB=OFF'
            '-D WITH_IPP=OFF'
            '-D WITH_CUDA=OFF'
            '-D USE_FAST_MATH=ON')

build() {
    cd "$srcdir"

    if [ -d $_svnmod/.svn ]; then
        (cd $_svnmod && svn up -r $pkgver)
    else
        svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi

    msg "SVN checkout done or server timeout"
    msg "Starting make..."


    cd $srcdir/$_svnmod/opencv/
		rm -rf build
		mkdir build
		cd build

		# x64, i.e "Athlon64" and upwards, can use SSE3
		[ $CARCH = x86_64 ] && \
			_cmakeopts=${_cmakeopts[@]/ENABLE_SSE3=OFF/ENABLE_SSE3=ON}

		cmake ${_cmakeopts[@]} ..

		make

		cd "$srcdir/$_svnmod//opencv/build"

		make DESTDIR="$pkgdir" install

		# install license file
		install -Dm644 "$srcdir/$_svnmod//opencv/doc/license.txt" \
			"$pkgdir/usr/share/licenses/$pkgname/LICENSE"

		cd "$pkgdir/usr/share"

		# prepare FSH-friendly dirs
		if [ -d OpenCV ]; then
			mv OpenCV opencv
		fi

		cp $srcdir/$_svnmod//opencv/samples/{python,python2} "$pkgdir/usr/share/opencv/samples/" -r

		## separate docs package; also be -R friendly
		#[ -d opencv/doc ] && mv opencv/doc "$srcdir/opencv-doc"

		## separate samples package
		#[ -d opencv/samples ] && mv opencv/samples "$srcdir/opencv-samples"
}

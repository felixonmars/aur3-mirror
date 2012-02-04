pkgname=libwebcam-svn
pkgver=97
pkgrel=1
pkgdesc="A libary that is designed to simplify the development of webcam applications"
arch=(i686 x86_64)
url="http://www.quickcamteam.net/software/libwebcam/"
license="GNU"
depends=('libxml2')
makedepends=('cmake' 'subversion' 'kernel26-headers')
source=('uvcvideo.h' 'cmake.patch' 'fix-videodev2.patch')
_svntrunk=http://svn.quickcamteam.net/svn/qct/webcam-tools/trunk
_svnmod=libwebcam

build() {
    cd $srcdir
    if [ -d $_svnmod/.svn ]; then
        (cd $_svnmod && svn up -r $pkgver)
    else
        svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi

    msg "SVN checkout done or server timeout"
    msg "Starting make..."
    rm -rf "$srcdir/$_svnmod-build"
    cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
    cd "$srcdir/$_svnmod-build"

    #until kernel26-headers has the header
    #cmake -DUVCVIDEO_INCLUDE_PATH=.../linux/drivers/media/video/uvc ..
    #or
    #make -DUVCVIDEO_INCLUDE_PATH=.../linux/include ..
    cp "$srcdir/uvcvideo.h"  common/include/
    patch -Np1 -i $srcdir/cmake.patch
    patch -Np1 -i $srcdir/fix-videodev2.patch

    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DUVCVIDEO_INCLUDE_PATH=../common/include/
    make
    make DESTDIR=$pkgdir install

    # makefile doesn't install includes by default
    install -Dm644 ../common/include/webcam.h "$pkgdir"/usr/include/webcam.h
}
md5sums=('92f24c9ba5f2b893317ad91b7ce1e8d6'
         'e8785c7576d0e09a29b31461dcb622a1')
md5sums=('92f24c9ba5f2b893317ad91b7ce1e8d6'
         'e8785c7576d0e09a29b31461dcb622a1'
         'ffb2d6370402e248b53addd897a4a113')

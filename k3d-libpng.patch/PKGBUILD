pkgname=k3d-libpng.patch
_pkgname=k3d
pkgver=0.8.0.1
pkgrel=1
pkgdesc="k-3d is a complete free-as-in-freedom 3D modeling, animation and rendering system."
arch=('i686' 'x86_64')
url="http://www.k-3d.org/wiki/Main_Page"
license="GPL"
depends=('glibmm' 'libsigc++2.0' 'expat' 'zlib' 'gtkmm' 'gtkglext' 'python' 
         'graphviz' 'freetype2' 'gnome-vfs' 'imagemagick' 'libjpeg' 'libpng' 
		 'libtiff' 'openexr' 'gts' 'libgnome' 'mesa' 'doxygen')
makedepends=('boost' 'cmake')
source=("http://download.sourceforge.net/project/k3d/K-3D%20Source/K-3D%200.8.0.1/$_pkgname-source-$pkgver.tar.bz2"
        "libpng-1.4.patch")
md5sums=('88027c4d43583df2496c25576d0f31b6'
         '694589ba703732d09d0c076c9776c907')

build() {
  cd $srcdir
  patch -p1 -d $_pkgname-source-$pkgver < libpng-1.4.patch
  mkdir k3d-build
  cd k3d-build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DK3D_BUILD_CGAL_MODULE=OFF $srcdir/$_pkgname-source-$pkgver || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}

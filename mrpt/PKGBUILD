# Maintainer: Mitchell Johnson <mjjohnso@mtu.edu>
pkgname=mrpt
pkgver=1.0.0
pkgrel=1
pkgdesc="libraries, algorithms, and applications employed in a number of mobile robotics research areas."
arch=('i686' 'x86_64')
url="http://www.mrpt.org"
license=('BSD')
depends=('opencv' 'wxgtk' 'ffmpeg' 'freeglut' 'zlib' 'libjpeg' 'libdc1394' 'desktop-file-utils')
optdepends=('libftdi' 'libusb: Kinect support' 'pcl' 'intel-tbb')
makedepends=('cmake')
install=mrpt.install
source=("http://downloads.sourceforge.net/project/mrpt/MRPT-all/MRPT-$pkgver/$pkgname-$pkgver.tar.gz"
         ffmpeg_gcc.patch octomap_gcc48.patch pbmap_pcl_ros.patch)
md5sums=('0be24558b039a5dca39da21d54178b7c'
          '926040f0edd35cb8e89dcd3dedf34ec0'
          'a8606488ac968d502790f0301282f6bd'
          '8b1cf659b5a4df8e4c1a5d166de3abd9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p0 <../octomap_gcc48.patch
  patch -p0 <../ffmpeg_gcc.patch
  patch -p0 <../pbmap_pcl_ros.patch
  mkdir build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DEIGEN_USE_EMBEDDED_VERSION=OFF \
           -DMRPT_OPTIMIZE_NATIVE=ON \
           -DMRPT_HAS_TBB=ON \
           -DBUILD_EXAMPLES=ON \
           -DPCL_DIR=/opt/ros/groovy/share/pcl-1.6 \
           -DUSER_EXTRA_CPP_FLAGS="-I/opt/ros/groovy/include/"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
}

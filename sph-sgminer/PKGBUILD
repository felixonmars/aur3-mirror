# Maintainer: gee
pkgname=sph-sgminer
pkgver=4.1.0.r103.g0001517
pkgrel=3
pkgdesc="A multi-threaded multi-pool GPU miner for various algorithms-based coins."
arch=('i686' 'x86_64')
url="https://bitcointalk.org/index.php?topic=475795.0"
license=('GPL3')
## I would like to use releases but currently they are too old to include any new coin
#source=("https://github.com/prettyhatemachine/sph-sgminer/archive/${pkgver}.tar.gz")
## I will change this when there will be a new release
source=("git+https://github.com/prettyhatemachine/sph-sgminer.git")
depends=('curl' 'libcl' 'libtool' 'pkg-config')
makedepends=('opencl-headers')
optdepends=('ncurses: For ncurses formatted screen output'
            'sgminer-adl-sdl: AMD ADL needed for GPU control with Catalyst'
            'opencl-nvidia: OpenCL implementation for NVIDIA'
            'opencl-catalyst: OpenCL implementation for AMD')
provides=('sph-sgminer')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  adlFolder="/opt/sgminer-adl-sdk"
  if [ -e ${adl} ]
  then
    echo "ADL found"
    cp ${adlFolder}/*.h $srcdir/${pkgname}/ADL_SDK/
 else
   echo "No ADL found"
 fi
}

build() {
    cd "$srcdir/${pkgname}"

    ./autogen.sh
    ./configure
    make
}

package() {
    cd "$srcdir/${pkgname}"
    
    mkdir -p $pkgdir/usr/bin
                  
    install -D -m755 sgminer $pkgdir/usr/bin/${pkgname}
    install -D -m644 kernel/*.cl $pkgdir/usr/bin/    
}

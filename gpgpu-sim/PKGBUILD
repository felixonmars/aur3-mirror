# Author: Andrew Boktor <andrew.boktor@gmail.com>

pkgname=gpgpu-sim
pkgver=3.0
pkgrel=1
pkgdesc="GPGPU Simulator"
arch=('i686' 'x86_64')
url="http://gpgpu-sim.org"
license=('GPL2')
depends=('ncurses' 'boost')
makedepends=('cuda3.1-toolkit' 'cuda3.1-sdk')


build() {
	git clone git://dev.ece.ubc.ca/gpgpu-sim --depth=1
	cd gpgpu-sim/v3.x/
	sed -i 's/^export\ CUDA_INSTALL_PATH.*$/export\ CUDA_INSTALL_PATH=\/usr\/local\/cuda3.1-toolkit/1' setup_enviroment
	sed -i 's/^export\ CUDAHOME.*$/export\ CUDAHOME=\$CUDA_INSTALL_PATH/1' setup_enviroment
	sed -i 's/^export\ NVIDIA_COMPUTE_SDK_LOCATION.*$/export\ NVIDIA_COMPUTE_SDK_LOCATION=\/usr\/local\/cuda3.1-sdk/1' setup_enviroment
	echo "Warning: Disabling OpenCl support in gpgpu-sim by default ..."
	sed -i 's/^export\ NVOPENCL_LIBDIR.*$/export\ NVOPENCL_LIBDIR=/1' setup_enviroment
	sed -i 's/#include/#include\ <cstdio>\n#include/1' decuda_to_ptxplus/decudaInst.cc
#	export PATH=$PATH:$CUDA_INSTALL_PATH/bin/
	source setup_enviroment
	make || return 1
}

package() {
	cd $pkgdir
	mkdir -p usr/local
	mv $srcdir/gpgpu-sim/v3.x usr/local/$pkgname
}


# Maintainer: Your Name Gunther Schulz < mail at guntherschulz.de >
pkgname=libsiftgpu
pkgver=400
pkgrel=1
pkgdesc="SiftGPU Libraries: A GPU Implementation of Scale Invariant Feature Transform (SIFT)"
arch=('i686' 'x86_64')
url="http://www.cs.unc.edu/~ccwu/siftgpu/"
license=('proprietary')
groups=()
#depends=( 'glew' 'freeglut' 'devil' 'cuda' )
depends=( 'glew' 'devil' 'cuda' )
makedepends=( 'mlocate' )
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://wwwx.cs.unc.edu/~ccwu/cgi-bin/siftgpu.cgi?SiftGPU-V${pkgver}.zip)
noextract=()
md5sums=('dbc14f3e073a64c1892bb0b05cd91dfc')

build() {
        cd "$srcdir/SiftGPU"
        make siftgpu_enable_cuda=1 siftgpu_enable_server=1 CUDA_INSTALL_PATH=/opt/cuda
}

package() {
        cd "$srcdir/SiftGPU/bin"
        install -Dm644 libsiftgpu.a "$pkgdir"/usr/lib/libsiftgpu.a
        install -Dm644 libsiftgpu.so "$pkgdir"/usr/lib/libsiftgpu.so
}

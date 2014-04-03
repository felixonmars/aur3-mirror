# Maintainer: Your Name Gunther Schulz < mail at guntherschulz.de > 
pkgname=pba
pkgver=1.0.5
pkgrel=1
pkgdesc="Multicore Bundle Adjustment"
arch=('i686' 'x86_64')
url="http://grail.cs.washington.edu/projects/mcba/"
license=('GPL')
groups=()

# Enable CUDA
depends=('cuda')
# No CUDA
#depends=()

makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://grail.cs.washington.edu/projects/mcba/${pkgname}_v${pkgver}.zip)
noextract=()
md5sums=('672f5cd6c1b4c08517409809b819c547')

build() {
        cd "$srcdir/${pkgname}"

        # Enable CUDA and AVX 
        make CUDA_INSTALL_PATH=/opt/cuda CFLAGS='-DCPUPBA_USE_AVX -I/opt/cuda/include -L/opt/cuda/lib64 -fPIC -L/usr/lib64 -L/usr/lib -L./bin -O2 -Wall -Wno-deprecated -pthread  -march=native -mfpmath=sse -fpermissive'

        # No CUDA and AVX
        #make -f makefile_no_gpu CUDA_INSTALL_PATH=/opt/cuda OUT_PBA=./bin/out
}

package() {
        install -d "$pkgdir"/etc/ld.so.conf.d
        echo "/opt/pba/lib" > "$pkgdir"/etc/ld.so.conf.d/pba.conf
        cd "$srcdir/${pkgname}/bin/"
        install -Dm755 libpba.so "$pkgdir"/opt/pba/lib/libpba.so
        install -Dm755 driver "$pkgdir"/opt/pba/driver
        install -Dm644 out/${pkgname}.o "$pkgdir"/opt/pba/lib/${pkgname}.o
        install -Dm644 out/ConfigBA.o "$pkgdir"/opt/pba/lib/ConfigBA.o
        install -Dm644 out/CuTexImage.o "$pkgdir"/opt/pba/lib/CuTexImage.o # Uncomment if built without CUDA
        install -Dm644 out/ProgramCU.o "$pkgdir"/opt/pba/lib/ProgramCU.o # Uncomment if built without CUDA
        install -Dm644 out/SparseBundleCPU.o  "$pkgdir"/opt/pba/lib/SparseBundleCPU.o 
        install -Dm644 out/SparseBundleCU.o "$pkgdir"/opt/pba/lib/SparseBundleCU.o # Uncomment if built without CUDA
}

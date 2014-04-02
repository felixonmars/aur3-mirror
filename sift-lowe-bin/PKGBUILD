# Maintainer: Your Name Gunther Schulz < mail at guntherschulz.de >
pkgname=sift-lowe-bin
pkgver=4
pkgrel=1
pkgdesc="Demo Software: SIFT Keypoint Detector"
arch=('i686' 'x86_64')
url="http://www.cs.ubc.ca/~lowe/keypoints/"
license=('proprietary')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://www.cs.ubc.ca/~lowe/keypoints/siftDemoV${pkgver}.zip)
noextract=()
md5sums=('59359becfe9379527f4a15b5b83f9e0f')

#build() {
#        cd "$srcdir/SiftGPU"
#        make siftgpu_enable_cuda=1 siftgpu_enable_server=1 CUDA_INSTALL_PATH=/opt/cuda
#}

package() {
        cd "$srcdir/siftDemoV4"
        install -Dm755 sift "$pkgdir"/usr/bin/sift
}

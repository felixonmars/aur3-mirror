# whaevr <whaevr[at]archlinux[dot]us>
# Contributors: everyone whos helped write/test wrapper

pkgname=lib32-nvcuda
pkgver=3.0
pkgrel=4
pkgdesc="Nvida CUDA wrapper for use with the folding@home gpu client"
arch=('x86_64')
url="http://www.linuxfah.info"
license=('custom')
depends=('lib32-nvidia-utils>=256.40' 'lib32-cuda-toolkit')
install=lib32-nvcuda.install
source=(http://www.linuxfah.info/wrapper-3.0/cudart/cudart.dll.so
http://www.linuxfah.info/wrapper-3.0/cufft/cufft.dll.so)

build() {
  mkdir -p ${pkgdir}/opt/fah-gpu
  install -m 755 ${startdir}/*.dll.so ${pkgdir}/opt/fah-gpu/

}

md5sums=('c8ab6792ccc8f1f07c2af288060e96c1'
         '6f24dab03758bc0b8ee89091a77ba284')

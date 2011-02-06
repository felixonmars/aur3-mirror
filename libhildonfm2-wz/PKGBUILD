# Contributor: Wean Chan <weanwz@gmail.com>
pkgname=libhildonfm2-wz
pkgver=1.9.23
pkgrel=3
pkgdesc="lib for pplive"
url="http://mirror.rootguide.org/ubuntu/pool/main/libh/libhildonfm/"
arch=('i686' 'x86_64')
license=('BSD')

if [ "${CARCH}" = 'x86_64' ]; then
  source=(http://mirror.rootguide.org/ubuntu/pool/main/libh/libhildonfm/libhildonfm2_${pkgver}+repack-0ubuntu1_amd64.deb)
  md5sums=("9f19c096561a0c5e60e547311610f1ee")
elif  [ "${CARCH}" = 'i686' ]; then 
  source=(http://mirror.rootguide.org/ubuntu/pool/main/libh/libhildonfm/libhildonfm2_${pkgver}+repack-0ubuntu1_i386.deb)
  md5sums=("c52dac1c3c663d014c1a4742beec557d")
fi

build() {
    cd $srcdir
if [ "${CARCH}" = 'x86_64' ]; then
    bsdtar xf "libhildonfm2_${pkgver}+repack-0ubuntu1_amd64.deb" || return 1
elif  [ "${CARCH}" = 'i686' ]; then 
    bsdtar xf "libhildonfm2_${pkgver}+repack-0ubuntu1_i386.deb" || return 1
fi
    bsdtar xf data.tar.gz -C $pkgdir || return 1
}


# Contributor: Wean Chan <weanwz@gmail.com>
pkgname=libhildonmime0-wz
pkgver=1.10.1
pkgrel=3
pkgdesc="lib for pplive"
url="http://mirror.rootguide.org/ubuntu/pool/universe/libh/libhildonmime/"
arch=('i686' 'x86_64')
license=('BSD')

if [ "${CARCH}" = 'x86_64' ]; then
  source=(http://mirror.rootguide.org/ubuntu/pool/universe/libh/libhildonmime/libhildonmime0_${pkgver}.debian.1-4_amd64.deb)
  md5sums=("3a08f8fbf84ae0ec7f236ed12f92f335")
elif  [ "${CARCH}" = 'i686' ]; then 
  source=(http://mirror.rootguide.org/ubuntu/pool/universe/libh/libhildonmime/libhildonmime0_${pkgver}.debian.1-4_i386.deb)
  md5sums=("e647b24acc70c5bf35698baafc3589ce")
fi

build() {
    cd $srcdir
if [ "${CARCH}" = 'x86_64' ]; then
    bsdtar xf "libhildonmime0_${pkgver}.debian.1-4_amd64.deb" || return 1
elif  [ "${CARCH}" = 'i686' ]; then 
    bsdtar xf "libhildonmime0_${pkgver}.debian.1-4_i386.deb" || return 1
fi
    bsdtar xf data.tar.gz -C $pkgdir || return 1
}


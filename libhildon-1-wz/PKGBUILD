# Contributor: Wean Chan <weanwz@gmail.com>
pkgname=libhildon-1-wz
pkgver=0_2.0.1
pkgrel=4
pkgdesc="lib for pplive"
url="http://mirror.rootguide.org/ubuntu/pool/main/libh/libhildon/"
arch=('i686' 'x86_64')
license=('BSD')
if [ "${CARCH}" = 'x86_64' ]; then
  source=(http://mirror.rootguide.org/ubuntu/pool/main/libh/libhildon/libhildon-1-${pkgver}-1ubuntu6_amd64.deb)
  md5sums=("2bd78fcc2074504398fa715a1b78579c")
elif  [ "${CARCH}" = 'i686' ]; then 
  source=(http://mirror.rootguide.org/ubuntu/pool/main/libh/libhildon/libhildon-1-${pkgver}-1ubuntu6_i386.deb)
  md5sums=("c3f23dcd3597bcbc0cc723d799b355a4")
fi

build() {
    cd $srcdir

if [ "${CARCH}" = 'x86_64' ]; then
    bsdtar xf "libhildon-1-${pkgver}-1ubuntu6_amd64.deb" || return 1
elif  [ "${CARCH}" = 'i686' ]; then 
    bsdtar xf "libhildon-1-${pkgver}-1ubuntu6_i386.deb" || return 1
fi
    bsdtar xf data.tar.gz -C $pkgdir || return 1
}


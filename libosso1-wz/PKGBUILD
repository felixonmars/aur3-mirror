# Contributor: Wean Chan <weanwz@gmail.com>
pkgname=libosso1-wz
pkgver=2.16
pkgrel=3
pkgdesc="lib for pplive"
url="http://mirror.rootguide.org/ubuntu/pool/universe/libo/libosso/"
arch=('i686' 'x86_64')
license=('BSD')

if [ "${CARCH}" = 'x86_64' ]; then
  source=(http://mirror.rootguide.org/ubuntu/pool/universe/libo/libosso/libosso1_${pkgver}-0ubuntu3_amd64.deb)
  md5sums=("4f3ae0dbdbf4bc76e0318de351f98215")
elif  [ "${CARCH}" = 'i686' ]; then 
  source=(http://mirror.rootguide.org/ubuntu/pool/universe/libo/libosso/libosso1_${pkgver}-0ubuntu3_i386.deb)
  md5sums=("638fdb091a25c8bbe1ddbe7c71cfab98")
fi

build() {
    cd $srcdir
if [ "${CARCH}" = 'x86_64' ]; then
    bsdtar xf "libosso1_${pkgver}-0ubuntu3_amd64.deb" || return 1
elif  [ "${CARCH}" = 'i686' ]; then 
    bsdtar xf "libosso1_${pkgver}-0ubuntu3_i386.deb" || return 1
fi
    bsdtar xf data.tar.gz -C $pkgdir || return 1
}



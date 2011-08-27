# Contributor: Wean Chan <weanwz@gmail.com>
pkgname=libhildonthumbnail0-wz
pkgver=0.14
pkgrel=4
pkgdesc="lib for pplive"
url="http://ftp.tw.debian.org/debian/pool/main/libh/libhildon/"
arch=('i686' 'x86_64')
license=('BSD')

if [ "${CARCH}" = 'x86_64' ]; then
  source=(http://ftp.tw.debian.org/debian/pool/main/h/hildon-thumbnail/libhildonthumbnail0_${pkgver}-1_amd64.deb)
  md5sums=("1ce63b165f9e5ef4954c296c61d6c32b")
elif  [ "${CARCH}" = 'i686' ]; then 
  source=(http://ftp.tw.debian.org/debian/pool/main/h/hildon-thumbnail/libhildonthumbnail0_${pkgver}-1_i386.deb)
  md5sums=("cc97ab5ba74e06965c35e5271dec1485")
fi

build() {
    cd $srcdir
if [ "${CARCH}" = 'x86_64' ]; then
    bsdtar xf "libhildonthumbnail0_${pkgver}-1_amd64.deb" || return 1
elif  [ "${CARCH}" = 'i686' ]; then 
    bsdtar xf "libhildonthumbnail0_${pkgver}-1_i386.deb" || return 1
fi
    bsdtar xf data.tar.gz -C $pkgdir || return 1
}



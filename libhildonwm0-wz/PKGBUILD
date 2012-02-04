# Contributor: Wean Chan <weanwz@gmail.com>
pkgname=libhildonwm0-wz
pkgver=2.0.11
pkgrel=3
pkgdesc="lib for pplive"
url="http://mirror.rootguide.org/ubuntu/pool/universe/h/hildon-desktop/"
arch=('i686' 'x86_64')
license=('BSD')

if [ "${CARCH}" = 'x86_64' ]; then
  source=(http://mirror.rootguide.org/ubuntu/pool/universe/h/hildon-desktop/libhildonwm0_${pkgver}-1~svn15367-0ubuntu4_amd64.deb)
  md5sums=("4c5591fdb8336ed64909e86f0ee330aa")
elif  [ "${CARCH}" = 'i686' ]; then 
  source=(http://mirror.rootguide.org/ubuntu/pool/universe/h/hildon-desktop/libhildonwm0_${pkgver}-1~svn15367-0ubuntu4_i386.deb)
  md5sums=("77c909f9987faa83eaf0bc63b82a4a20")
fi

build() {
    cd $srcdir
if [ "${CARCH}" = 'x86_64' ]; then
    bsdtar xf "libhildonwm0_${pkgver}-1~svn15367-0ubuntu4_amd64.deb" || return 1
elif  [ "${CARCH}" = 'i686' ]; then
    bsdtar xf "libhildonwm0_${pkgver}-1~svn15367-0ubuntu4_i386.deb" || return 1
fi
    bsdtar xf data.tar.gz -C $pkgdir || return 1
}



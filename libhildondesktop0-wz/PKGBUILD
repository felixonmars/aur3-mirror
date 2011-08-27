# Contributor: Wean Chan <weanwz@gmail.com>
pkgname=libhildondesktop0-wz
pkgver=2.0.11
pkgrel=3
pkgdesc="lib for pplive"
url="http://mirror.rootguide.org/ubuntu/pool/universe/h/hildon-desktop/"
arch=('i686' 'x86_64')
license=('BSD')

if [ "${CARCH}" = 'x86_64' ]; then
  source=(http://mirror.rootguide.org/ubuntu/pool/universe/h/hildon-desktop/libhildondesktop0_${pkgver}-1~svn15367-0ubuntu4_amd64.deb)
  md5sums=("96d99a3da791d3ec22a0f7b343463932")
elif  [ "${CARCH}" = 'i686' ]; then 
  source=(http://mirror.rootguide.org/ubuntu/pool/universe/h/hildon-desktop/libhildondesktop0_${pkgver}-1~svn15367-0ubuntu4_i386.deb)
  md5sums=("5f7d5917ce91a5400c92d8a039be9bb0")
fi

build() {
    cd $srcdir
if [ "${CARCH}" = 'x86_64' ]; then
    bsdtar xf "libhildondesktop0_${pkgver}-1~svn15367-0ubuntu4_amd64.deb" || return 1
elif  [ "${CARCH}" = 'i686' ]; then 
    bsdtar xf "libhildondesktop0_${pkgver}-1~svn15367-0ubuntu4_i386.deb" || return 1
fi
    bsdtar xf data.tar.gz -C $pkgdir || return 1
}


# Contributor: Wean Chan <weanwz@gmail.com>
pkgname=libexpat1-wz
pkgver=2.0.1
pkgrel=3
pkgdesc="lib for pplive"
url="http://mirror.rootguide.org/ubuntu/pool/main/e/expat/"
arch=('i686' 'x86_64')
license=('BSD')
source=(http://mirror.rootguide.org/ubuntu/pool/main/e/expat/libexpat1_${pkgver}-4_i386.deb)
md5sums=("91637a668e31ad7d06a05734a2408b72")

build() {
    cd $srcdir

    bsdtar xf "libexpat1_${pkgver}-4_i386.deb" || return 1
    bsdtar xf data.tar.gz -C $pkgdir || return 1
}


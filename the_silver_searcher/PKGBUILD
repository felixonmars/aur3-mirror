# Contributor: Jeff Horelick <jdhore1@gmail.com>
# Maintainer: skydrome <skydrome@i2pmail.org>

pkgname=the_silver_searcher
pkgver=0.13.1
pkgrel=1
pkgdesc='A code searching tool similar to Ack, but faster'
url='http://github.com/ggreer/the_silver_searcher'
license=('Apache')
depends=('pcre')
arch=('i686' 'x86_64')
source=("https://github.com/downloads/ggreer/${pkgname}/${pkgname}-${pkgver}.tar.gz")
#source=(${pkgname}-${pkgver}.tar.gz::http://github.com/ggreer/${pkgname}/tarball/${pkgver})
md5sums=('d12865f47ec7d643b70b81cf252cfc3d')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    #cd ${srcdir}/ggreer-${pkgname}-*
    aclocal
    autoconf
    autoheader
    automake --add-missing
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    #cd ${srcdir}/ggreer-${pkgname}-*
    make DESTDIR="${pkgdir}" install
}

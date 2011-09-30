# Maintainer: Tianjiao Yin <ytj000+aur@gmail.com>

pkgname=boost-doc-zh
pkgver=1.41.0
pkgdesc="Chinese documetation of Boost, a free peer-reviewed portable C++ source libraries."
pkgrel=2
arch=("any")
url="http://www.boost.org/"
license=('custom')
_filename=boost_1_41_0_doc_20091225.7z
source=(http://boost-doc-zh.googlecode.com/files/$_filename)
md5sums=('435ea362653c99801141301ed30a6763')
noextract=($_filename)
makedepends=("p7zip")

build() {
    7z x $_filename

    # There is a giant bug in current version
    chmod 755 ${srcdir} -R

    rm ${srcdir}/$_filename
    mkdir -p ${pkgdir}/usr/share/doc/boost
    mv ${srcdir}/* ${pkgdir}/usr/share/doc/boost/zh
}


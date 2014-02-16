# Maintainer: Shaun Westmacott <xyem@electricjungle.org>

pkgname="tagsistant-base"
_pkgname="tagsistant"
pkgver="0.7"
pkgrel="1"
pkgdesc="A semantic file-system based on Fuse for Linux kernel"
url="http://www.tagsistant.net/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('fuse' 'libextractor')
conflicts=('tagsistant-svn', 'tagsistant')
source=(
    "${_pkgname}.tgz::http://www.tagsistant.net/download/${_pkgname}-0-7/finish/5-${_pkgname}-0-7/11-${_pkgname}-0-7/0"
    'disable_plugins.patch'
)
sha1sums=(
    'ff2fc515ef7e6f6bb05595e207869927d0a94a4f'
    'dcbe0c8494cb6fef8ae06d7b7e1bf9cf42f9147a'
)

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}/"

    patch -Np2 -i ../disable_plugins.patch

    autoreconf -vfi
    ./configure --prefix=/usr --datarootdir="${pkgdir}/usr/share"
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}/"

    make DESTDIR="$pkgdir/" install
}

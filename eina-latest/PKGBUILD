# Maintainer: Julie Iaccarino <reiv3r@gmail.com>

pkgname=eina-latest
_pkgname=eina
pkgver=1.7.6
pkgrel=2
pkgdesc='E17 Core data structure library'
url='http://enlightenment.org/'
license=('LGPL2.1')
arch=('i686' 'x86_64')
options=('!emptydirs')
makedepends=('glibc')
provides=('eina=1.7.6')
conflicts=('eina')
source=("http://download.enlightenment.org/releases/${_pkgname}-${pkgver}.tar.gz")
md5sums=('4f0075f404223284dac0f34f676c511e')

build() {
        cd "${srcdir}/${_pkgname}-${pkgver}"

        CPPFLAGS="${CXXFLAGS}" LIBS="${LDFLAGS}" \
        ./configure \
                --prefix=/usr \
                --sysconfdir=/etc \

        make
}

package() {
        cd "${srcdir}/${_pkgname}-${pkgver}"
        make DESTDIR="${pkgdir}" install
}



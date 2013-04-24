# Maintainer: Julie Iaccarino <reiv3r@gmail.com>

pkgname=eet-latest
_pkgname=eet
pkgver=1.7.6
pkgrel=2
pkgdesc='E17 Data encode/decode and storage library'
url='http://enlightenment.org/'
license=('LGPL2.1')
arch=('i686' 'x86_64')
options=('!emptydirs')
makedepends=('glibc')
provides=('eet=1.7.6')
conflicts=('eet')
source=("http://download.enlightenment.org/releases/${_pkgname}-${pkgver}.tar.gz")
md5sums=('16a3b3cffbc7d63a5efdd673793e4a7a')

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



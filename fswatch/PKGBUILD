# Maintainer: stephane.travostino@gmail.com
#
# Contributions welcome on github.com/1player/aur

pkgname=fswatch
pkgver=1.4.5.3
pkgrel=1
pkgdesc="A cross-platform file change monitor"
url="https://github.com/emcrisostomo/fswatch"
arch=('i686' 'x86_64')
license=('BSD')
depends=('bash' 'gcc-libs')
makedepends=('autoconf' 'automake' 'libtool')
source=("https://github.com/emcrisostomo/fswatch/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('2f9ce7dcebf18893ea770848845b5cd6')


build() {
    cd "${srcdir}/fswatch-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/fswatch-${pkgver}"
    make DESTDIR=${pkgdir} install
    install -D LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

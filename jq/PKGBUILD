# Submitter: Alex Chamberlain <alex@alexchamberlain.co.uk>
# Maintainer: Kars Wang <jaklsy@gmail.com>

pkgname=jq
pkgver=1.4
pkgrel=1
pkgdesc='Command-line JSON processor'
arch=('i686' 'x86_64')
url='http://stedolan.github.io/jq/'
license=('custom')
groups=()
depends=()
makedepends=('python2' 'autoconf' 'automake' 'bison' 'flex' 'glibc')
checkdepends=()
optdepends=()
provides=()
conflicts=()
source=("http://stedolan.github.io/jq/download/source/${pkgname}-${pkgver}.tar.gz")
noextract=()
md5sums=('e3c75a4f805bb5342c9f4b3603fb248f')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make DESTDIR="$pkgdir" prefix=/usr install
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/jq"
}

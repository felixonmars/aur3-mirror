# Contributor: m0rph < m0rph.mailbox (at) gmail.com >

pkgname=mytetra
pkgver=1.30.1
pkgrel=1
pkgdesc='Smart manager for information collecting'
arch=('i686' 'x86_64')
url='http://webhamster.ru/site/page/index/articles/projectcode/105'
license=('GPL3')
depends=('qt4')
makedepends=('make')
_package_name=${pkgname}_${pkgver//./_}_src
source=("http://webhamster.ru/db/data/articles/105/$_package_name.zip")
md5sums=('3af1f0feacec645540c0857d57669fa1')

build() {
cd "${srcdir}" || return 1

# Fix gcc4.7 deps
sed -i "1i#include <unistd.h>" src/qtsingleapplication/qtlocalpeer.cpp

# Change install dir to /usr/bin
sed -i -e "s|mytetra_binary.path=/usr/local/bin|mytetra_binary.path=/usr/bin|" mytetra.pro
BINARY_INSTALL_PATH=/usr/bin

qmake -qt4 || return 1

msg "Starting make..."
make CXXFLAGS="-fpermissive" || return 1
}

package() {
cd "${srcdir}" || return 1
msg "Installing to package directory..."
make INSTALL_ROOT="${pkgdir}" install || return 1
}

# Maintainer: Sabart Otto - Seberm <seberm[at]gmail[dot].co
# Contributor: Uzsolt
 
pkgname=bgslibrary-git

pkgver=1.9.0
pkgrel=3
pkgdesc="framework to perform background subtraction (BGS)"
url="https://github.com/andrewssobral/bgslibrary"
arch=('any')
license=('GPLv3')
install=
depends=('opencv>=2.3.1')
optdepends=
conflicts=
provides=
makedepends=('git' 'cmake>=2.8')
source=("$pkgname"::'git+https://github.com/andrewssobral/bgslibrary.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}
 
package() {
    cd "$srcdir/$pkgname"
    make install DESTDIR="${pkgdir}" || return 1
}

build() {
    cd "$srcdir/$pkgname"

    cmake -DCMAKE_INSTALL_PREFIX="/usr" .
    make
}

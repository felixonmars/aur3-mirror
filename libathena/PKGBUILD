# PKGBUILD for libAthena
# Maintainer: Phillip "Antidote" Stephens <antidote dot crk at gmail dot com>
_pkgname=libathena
pkgname=$_pkgname
pkgver=v1.0.0
pkgrel=1
pkgdesc="Basic cross platform IO library"
arch=('i686' 'x86_64')
url=("https://github.com/Antidote/Athena/tree/v1.0.0")
source=("https://github.com/Antidote/Athena/releases/download/v1.0.0/libAthena.v1.0.0.tar.gz")
options=(staticlibs)
license="GPL3"
conflicts=('libathena-git')
depends=('zlib')
makedepends=('git' 'qt5-base' 'sed')
sha256sums=('eb437273ef9c1ee2cedff5591e06ffcfb452cd7f3e8fa20f5424e58f8b55561b')

pkgver() {
    cd "$srcdir"
}

build() {
    cd "$srcdir"
    qmake && make
}

package() {
    cd "$srcdir"
	qmake PREFIX="$pkgdir/usr" && make install
}

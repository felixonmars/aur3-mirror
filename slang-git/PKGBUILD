# Maintainer: Bastien Dejean <baskerville@lavabit.com>

_pkgname=slang
pkgname=${_pkgname}-git
pkgver=538
pkgrel=1
pkgdesc='S-Lang is a powerful interpreted language'
arch=('i686' 'x86_64')
url="http://www.jedsoft.org/${_pkgname}/index.html"
license=('GPL2')
depends=('glibc' 'pcre' 'zlib')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git://git.jedsoft.org/git/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git rev-list --count HEAD
}

build() {
    cd "$srcdir/$_pkgname"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir" install
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

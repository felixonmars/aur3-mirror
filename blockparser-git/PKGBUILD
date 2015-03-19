# Maintainer: Michael Egger <gcarq@archlinux.info>
pkgname=blockparser-git
pkgver=20150205
pkgrel=1
pkgdesc="Fast, quick and dirty bitcoin blockchain parser"
arch=('i686' 'x86_64')
url="https://github.com/znort987/blockparser"
license=('CC0')
makedepends=('gcc' 'git' 'boost' 'openssl')
source=("${pkgname}::git://github.com/znort987/blockparser.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git log -1 --pretty=format:%cd --date=short | sed 's/-//g'
}

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    install -D -m 755 "${srcdir}/${pkgname}/parser" "${pkgdir}/usr/bin/blockparser"
}
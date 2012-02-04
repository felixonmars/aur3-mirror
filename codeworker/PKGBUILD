# Maintainer: Feydaykyn <feydaykyn[at]yahoo[dot]fr>
pkgname=codeworker
pkgver=4_5_4
pkgrel=1
pkgdesc="A universal parsing tool & a source code generator"
url="http://www.codeworker.org/"
arch=('x86_64' 'i686')
license=('LGPL2.1')

_realname=CodeWorker_SRC${pkgver}

source=("http://codeworker.googlecode.com/files/${_realname}.tgz")
sha1sums=('b639302a690a8bd00b69015d83767c8270b8d940')

_realpath=Codeworker_

build() {
  cd "${srcdir}/${_realpath}${pkgver}"
  make
}

package () {
    cd "${srcdir}/${_realpath}${pkgver}"
    mkdir -p "${pkgdir}/usr/bin/"
    mv ${pkgname} "${pkgdir}/usr/bin/"
}
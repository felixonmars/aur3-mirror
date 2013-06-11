# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Contributor: Sylvain HENRY <hsyl20@gmail.com>
# Contributor: Jeff Bowman <jeff.t.bowman@gmail.com>

pkgname=emacs-scala-mode
pkgver=2.10.2
pkgrel=1
pkgdesc="Scala-mode for emacs"
arch=('any')
url="http://www.scala-lang.org"
license=('custom')
depends=('emacs')
makedepends=('make')
source=(http://www.scala-lang.org/downloads/distrib/files/scala-tool-support-${pkgver}.tgz)
md5sums=('57d6618074b0e0421aa528830f47b0dd')
install=emacs_scala_mode.install

build() {
    cd "$srcdir/scala-tool-support-${pkgver}/scala-emacs-mode"
    make
}

package() {
    cd "$srcdir/scala-tool-support-${pkgver}/scala-emacs-mode"
    mkdir -p "${pkgdir}/usr/share/emacs/scala-mode"
    install -m0644 *.elc "${pkgdir}/usr/share/emacs/scala-mode/"
}


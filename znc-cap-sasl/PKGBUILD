# Maintainer: Markus Holtermann <aur@markusholtermann.eu>
pkgname=znc-cap-sasl
pkgver=0.1
pkgrel=1
pkgdesc='Support SASL authentication when connecting to irc networks which support CAP SASL'
arch=('i686' 'x86_64')
url='https://github.com/mquin/znc/'
license=('GPL')
depends=('znc')
source=("https://raw.github.com/mquin/znc/f4bc8c99aa7e0fb21dc37f2b82c3832a7f28f3b6/cap_sasl.cpp")
md5sums=('3bd1f6a132b66545adf93e2eea8ff1bb')

build() {
    cd "$srcdir/"
    znc-buildmod cap_sasl.cpp
}

package() {
    mkdir -p $pkgdir/usr/lib/znc/
    install $srcdir/cap_sasl.so $pkgdir/usr/lib/znc/
}

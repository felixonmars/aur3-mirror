# Maintainer : Brendan Long <korin43@gmail.com>

pkgname=('magic-background')
pkgdesc='Sets the desktop background to a random screensaver.'
pkgver=1.0
pkgrel=3
arch=('i686' 'x86_64')
url="http://www.brendanlong.com/magic-background.php"
license=('BSD')
depends=('python' 'xscreensaver')
makedepends=()
options=()
source=(http://www.brendanlong.com/files/magic-background-$pkgver.tar.gz)
md5sums=('a7bcfcd8b2d30c73f27e7b996aa47806')

build() {
    mkdir -p "${pkgdir}/usr/bin"
    cp "${srcdir}/magic-background.py" "${pkgdir}/usr/bin/magic-background"
}


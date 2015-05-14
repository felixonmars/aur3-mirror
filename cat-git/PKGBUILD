# Maintainer: Richard Vock <vock at cs dot uni-bonn dot de>

pkgname=cat-git
pkgver=1.0.r8.g7a13da5
pkgrel=1
pkgdesc="A C++14 functional library inspired by category theory and the Haskell language"
arch=('x86_64' 'i686')
url='https://cat.github.io/'
license=('MIT')
depends=()
makedepends=('git')
source=("git://github.com/cat/cat.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/cat"
    git describe --tags --long | sed -r 's/v//; s/-/.r/; s/-/./'
}

package() {
    cd "$srcdir/cat"
    mkdir -p "$pkgdir/usr/include"
    cp -r cat "$pkgdir/usr/include"
}

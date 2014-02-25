# Maintainer: Germain Z. <germanosz@gmail.com>
pkgname=clbin-git
pkgrel=1
pkgver=3.f083216
pkgdesc="Upload text and images to clbin.com from the command line"
arch=('any')
url="https://gist.github.com/GermainZ/9177423"
license=('ISC')
depends=()
makedepends=('git')
provides=('clbin')
source=("clbin::git+https://gist.github.com/9177423.git")
md5sums=('SKIP')

pkgver() {
    cd clbin
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    cd clbin
    install -Dm755 "clbin" "${pkgdir}/usr/bin/clbin"
}

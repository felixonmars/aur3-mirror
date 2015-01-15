# Maintainer: Doug Richardson <dougie.richardson@gmail.com>
pkgname=git-publish
pkgver=1.0.1
pkgrel=2
pkgdesc="Publish a git repository as a tarball"
arch=(any)
url="https://github.com/drichardson/arch_packages"
license=('BSD')
depends=(rsync git tar)
optdepends=()
backup=()
changelog=
install=
source=(git-publish)
sha256sums=('d0fa8eefe47874bee0ff5ccd54bf42c6e450a192bfd403696b171c23b642f514')

package() {
    cd "$srcdir"
    install -Dm755 git-publish "$pkgdir"/usr/bin/git-publish
}

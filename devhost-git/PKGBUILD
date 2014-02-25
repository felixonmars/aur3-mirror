# Maintainer: Germain Z. <germanosz@gmail.com>
pkgname=devhost-git
pkgver=39.47eebb6
pkgrel=1
pkgdesc="Upload and manage files on http://d-h.st (Dev-Host)"
arch=('any')
url="https://github.com/GermainZ/dev-host-cl.git"
license=('GPL3')
depends=('python' 'python-requests')
makedepends=('git')
provides=('devhost')
source=("devhost::git+https://github.com/GermainZ/dev-host-cl.git")
md5sums=('SKIP')

pkgver() {
    cd devhost
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    cd devhost
    install -Dm755 "devhost.py" "${pkgdir}/usr/bin/devhost"
}

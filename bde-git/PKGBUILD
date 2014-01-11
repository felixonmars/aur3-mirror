# Submitter: Alex Chamberlain <alex@alexchamberlain.co.uk>
# Maintainer: Alex Chamberlain <alex@alexchamberlain.co.uk>

pkgname=bde-git
_gitname='bde'
pkgver=baa88d9
pkgrel=1
pkgdesc='Bloomberg Development Environment'
arch=('x86_64')
url='http://bloomberg.github.io/bde/'
license=('MIT')
groups=()
depends=()
makedepends=('python2' 'git' 'glibc')
checkdepends=()
optdepends=()
provides=()
conflicts=()
source=('git+https://github.com/bloomberg/bde')
md5sums=(SKIP)
options=('staticlibs')

pkgver() {
    cd "$_gitname"
    git rev-parse --short HEAD
}

build() {
    cd "$_gitname"
    python2 waf configure -a 64 --prefix "$pkgdir/usr/"
    python2 waf build
}

package() {
    cd "$_gitname"
    python2 waf install
    mkdir -p -m644 "${pkgdir}/usr/share/licenses/$pkgname"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
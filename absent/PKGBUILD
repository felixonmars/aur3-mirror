pkgver=047dedd
pkgrel=1
pkgname="absent"
pkgdesc="Bash script to ease installing from ABS"
url="http://github.com/JohannesSM64/absent"
license="public domain"
arch=("any")
makedepends=("git")
depends=("findutils" "bash" "pacman")
optdepends=()
_gitname=absent
source=('git+https://github.com/JohannesSM64/absent.git')
md5sums=('SKIP')

pkgver() {
    cd $_gitname
    git describe --always | sed 's|-|.|g'
}

package() {
    cd $_gitname      
    mkdir -p "$pkgdir/usr/bin"
    install -m 755 absent "$pkgdir/usr/bin/absent"
}

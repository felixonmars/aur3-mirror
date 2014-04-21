pkgver=20130819
pkgrel=1
pkgname="absent"
pkgdesc="Bash script to ease installing from ABS"
url="http://github.com/JohannesSM64/absent"
license="public domain"
arch=("any")
makedepends=("git")
depends=("findutils" "bash" "pacman")
optdepends=()
source=('git+https://github.com/JohannesSM64/absent.git')
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

package() {
    cd "$pkgname"
    mkdir -p "$pkgdir/usr/bin"
    install -m 755 absent "$pkgdir/usr/bin/absent"
}

# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: Zerial <fernando@zerial.org>

_pkgname=fluxstyle
pkgname=$_pkgname-git
pkgver=4.0d666df
pkgrel=1
pkgdesc="A graphical style/theme manager for the fluxbox windows manager."
arch=(any)
url=https://github.com/michaelrice/fluxStyle
license=(GPL2)
depends=(pygtk)
makedepends=(git)
provides=($_pkgname)
source=($pkgname::git://github.com/michaelrice/fluxStyle.git $pkgname-gladefix.patch)
sha256sums=('SKIP'
    '4d872fd3af3d5747b6a33b4304f8aff231ab669a447ecabd31603e6dc0ec8728')
sha512sums=('SKIP'
    '017abc8af85ccffd28aed3488b87d4a07992c6acfbcfa5146755b51c4528023538fb90ab4c1837e1f89c701f6781ec94ab19b3615117342c7ed9332cfed9788e')

pkgver() {
    cd $pkgname/
    echo $(git shortlog | grep -c '\s\+').$(git describe --always)
}


prepare() {
    cd $pkgname/
    patch -Np0 -i ../$pkgname-gladefix.patch
    sed -i 's:^#!/usr/bin/env python$:&2:g' fluxStyle
    sed -i -e '51,51 s:images:glade:' -e 's:^#!/usr/bin/env python$:&2:g' setup.py
}

build() {
    cd $pkgname/
    ./setup.py build
}

package() {
    cd $pkgname/
    ./setup.py install --root="$pkgdir"
}

# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=passmenu-git
_gitname=passmenu
pkgver=v0.0.0.r0.g96dd2f1
pkgrel=1
pkgdesc="Copy passwords using pass and dmenu"
license=( MIT )
url=https://github.com/cdown/passmenu
depends=( dmenu pass )

arch=( any )
makedepends=( git )
conflicts=( passmenu )
provides=( passmenu  )
source=( git://github.com/cdown/passmenu.git )
md5sums=( SKIP )

pkgver() {
    cd "$_gitname"
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    install -D -m755 \
        "$_gitname/passmenu" \
        "$pkgdir/usr/bin/passmenu"
}

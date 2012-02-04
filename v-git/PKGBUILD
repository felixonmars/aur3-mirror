# Maintainer: Patrick Palka <patrick@parcs.ath.cx>
# Development: http://closure.ath.cx/aur-dev

pkgname=v-git
pkgver=20111009
pkgrel=1
pkgdesc="z for vim"
url="http://github.com/rupa/v"
arch=('any')
license=('WTFPL')
depends=('sh')
makedepends=('git')

_gitroot="git://github.com/rupa/v.git"
_gitname="v"

package() {
    msg "Connecting to $_gitname repository..."
    if [ -d "$_gitname" ]; then
        cd "$_gitname" && git pull origin
        msg "The local files are updated."
    else
        git clone --depth 1 "$_gitroot" && cd "$_gitname"
    fi

    install -vDm755 v  "$pkgdir/usr/bin/v"
    install -vDm644 v.1    "$pkgdir/usr/share/man/man1/v.1"
}

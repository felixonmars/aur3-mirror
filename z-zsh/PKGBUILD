# Maintainer: giorgio@gilest.ro

pkgname=z-zsh
pkgver=20110823
pkgrel=1
pkgdesc="A zsh port of z. z keeps track of where you've been and provides a convenient \
way to jump to directory that you actually use"
url="http://github.com/sjl/z-zsh"
arch=('any')
license=('WTFPL')
depends=('zsh')
makedepends=('git')

_gitroot="git://github.com/sjl/z-zsh.git"
_gitname="z-zsh"

package() {
    msg "Connecting to $_gitname repository..."
    if [ -d "$_gitname" ]; then
        cd "$_gitname" && git pull origin
        msg "The local files are updated."
    else
        git clone "$_gitroot" && cd "$_gitname"
    fi

    install -vDm755 z.sh  "$pkgdir/etc/profile.d/z.sh"
    install -vDm644 README "$pkgdir/usr/share/doc/z-zsh/README"
}

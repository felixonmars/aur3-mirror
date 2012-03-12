# Maintainer: Fred Morcos <fred.morcos@gmail.com>
# Development: https://gitorious.org/linux-powersave-scripts

pkgname=linux-powersave-scripts
pkgver=20120312
pkgrel=1
pkgdesc="A (currently simple) script that could help save some power on laptops running Linux."
url="https://gitorious.org/linux-powersave-scripts"
arch=('any')
license=('Public Domain')
depends=('linux' 'bash' 'hdparm' 'wireless_tools' 'ethtool')
makedepends=('git')

_gitroot="git://gitorious.org/linux-powersave-scripts/linux-powersave-scripts.git"
_gitname="linux-powersave-scripts"

package() {
    msg "Connecting to $_gitname repository..."
    if [ -d "$_gitname" ]; then
        cd "$_gitname" && git pull origin
        msg "The local files are updated."
    else
        git clone "$_gitroot" && cd "$_gitname"
    fi

    install -vDm755 powersave  "$pkgdir/usr/bin/powersave"
    install -vDm644 DEPENDENCIES "$pkgdir/usr/share/doc/linux-powersave-scripts/DEPENDENCIES"
    install -vDm644 CONTRIBUTORS "$pkgdir/usr/share/doc/linux-powersave-scripts/CONTRIBUTORS"
}

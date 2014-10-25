# Maintainer: Todd Partridge <http://https://github.com/Gen2ly/archpkgs>

pkgname=systemd-timer-pkgcacheclean
_pkgname=pkgcacheclean
pkgver=1.8.1
pkgrel=1
pkgdesc="Systemd timer to run pkgcacheclean monthly."
arch=(any)
url='https://bbs.archlinux.org/viewtopic.php?pid=841774'
license=(GPL)
depends=(pkgcacheclean)
source=("$_pkgname".timer
        "$_pkgname".service
        "$_pkgname"3.timer
        "$_pkgname"3.service)
md5sums=('3d3d972336c061d87ed74ac9dec2268c'
         'df8836a503d8174313c026504a40a386'
         '3d3d972336c061d87ed74ac9dec2268c'
         '9a1c664a1144b318a5ff608de3840330')

package() {
    _syddir=$pkgdir/usr/lib/systemd/system/
    install -Dm644 "$_pkgname".service  $_syddir/"$_pkgname".service
    install -Dm644 "$_pkgname".timer    $_syddir/"$_pkgname".timer
    install -Dm644 "$_pkgname"3.service $_syddir/"$_pkgname"3.service
    install -Dm644 "$_pkgname"3.timer   $_syddir/"$_pkgname"3.timer
}

# vim:set ts=2 sw=2 et:
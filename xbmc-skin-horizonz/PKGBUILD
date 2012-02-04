# Contributor: Ralf Barth <archlinux dot or at haggy dot org>
# Contributor: Richard Atkinson atkinsonr at gmail
#
# Suggestions for improvement welcome.
#
# History
#
# 8th June 2009
# ---------------
# 4.1-1 haggy: First release into AUR. I host on my machine because the
#              sources reside on a one-click-hoster atm.
#

pkgname=xbmc-skin-horizonz
pkgver=4.1
pkgrel=1
pkgdesc="Horizonz Vol. IV skin for XBMC"
arch=('i686' 'x86_64')
url="http://xbmc.org/forum/showthread.php?t=48504"
source=('http://dump.haggy.org/aur/Horizonz4.1.rar')
depends=('xbmc')
makedepends=('unrar')
provides=()
groups=('multimedia')
license=('GPL')
md5sums=('65921a03a02287214734b3ecf25c2986')
options=()

build() {
    #Copy tree to share location
    mkdir -p $pkgdir/usr/share/xbmc/skin
    cd $srcdir && unrar x Horizonz4.1.rar
    cp -r "$startdir/src/Horizonz4.1" "$pkgdir/usr/share/xbmc/skin/"
}

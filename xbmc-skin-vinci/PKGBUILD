# Contributor: Ralf Barth <archlinux dot or at haggy dot org>
# Contributor: Richard Atkinson atkinsonr at gmail
#
# Suggestions for improvement welcome.
#
# History
# 
# 30th April 2009
# ---------------
# 20080911  haggy: First release into AUR
#

pkgname=xbmc-skin-vinci
pkgver=20080911
pkgrel=1
pkgdesc="Vinci skin for XBMC"
arch=('i686' 'x86_64')
url="http://mntz.comyr.com/"
source=('http://mntz.comyr.com/Vinci.rar')
depends=('xbmc')
makedepends=('unrar')
provides=()
groups=('multimedia')
license=('GPL')
md5sums=('194f479b8d92e0530de471ec2c8f3337')
options=()

build() {
    #Copy tree to share location
    unrar x -inul "$srcdir/Vinci.rar" "$srcdir"
    mkdir -p $pkgdir/usr/share/xbmc/skin
    cp -r "$srcdir/Vinci" "$pkgdir/usr/share/xbmc/skin/"
}

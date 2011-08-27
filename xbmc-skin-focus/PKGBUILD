# Contributor: Ralf Barth <archlinux dot or at haggy dot org>
# Contributor: Richard Atkinson atkinsonr at gmail
#
# Suggestions for improvement welcome.
#
# History
# 
# 2009-05-29  Alpha6c-2   haggy: Added unzip to make dependencies
# 2009-04-30  Alpha6c-1   haggy: First release into AUR
#

pkgname=xbmc-skin-focus
pkgver=Alpha6c
pkgrel=2
pkgdesc="Focus skin for XBMC"
arch=('i686' 'x86_64')
url="http://code.google.com/p/xbmc-focus/"
source=('http://xbmc-focus.googlecode.com/files/Focus.Alpha6c.111109.zip')
depends=('xbmc')
makedepends=('unzip')
provides=()
groups=('multimedia')
license=('GPL')
md5sums=('8ce7949c9520ce2d26153e9a2f3abc21')
options=()

build() {
    #Copy tree to share location
    mkdir -p $pkgdir/usr/share/xbmc/skin
    cp -r "$startdir/src/Focus Alpha 6c" "$pkgdir/usr/share/xbmc/skin/Focus"
}

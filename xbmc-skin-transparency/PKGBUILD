# Contributor: Ralf Barth <archlinux dot or at haggy dot org>
# Contributor: Richard Atkinson atkinsonr at gmail
 
pkgname=xbmc-skin-transparency
pkgver=2.11
pkgrel=2
pkgdesc="Transparency! skin for XBMC"
arch=('i686' 'x86_64')
url="http://xbmc.org/skins/transparency/"
source=("http://sshcs.com/xbmc/binaries/skins/Transparency!/Transparency!.rar")
depends=('xbmc=9.11')
makedepends=('unrar')
provides=()
groups=('multimedia')
license=('GPL')
md5sums=('e5f08537937116f772d80f9326770dd9')
options=()
 
build() {
    #Copy tree to /opt
    mkdir -p $pkgdir/opt/xbmc/skin
    cd $srcdir
    unrar x "Transparency!.rar"
    cp -r "$startdir/src/Transparency!" "$pkgdir/opt/xbmc/skin/"
}
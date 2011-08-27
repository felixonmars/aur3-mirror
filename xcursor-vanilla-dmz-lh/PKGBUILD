pkgname=xcursor-vanilla-dmz-lh
pkgver=0.4
pkgrel=1
pkgdesc="Vanilla DMZ cursor theme, modified to left handed version"
arch=('i686' 'x86_64')
url="http://jimmac.musichall.cz/themes.php?skin=7"
license=("MIT")
source=(Vanilla-DMZ-LH.tar.bz2)
md5sums=('9c35b7ac5ec98391ec3b6c518b3636e3')

build() {
    mkdir -p $startdir/pkg/usr/share/icons/Vanilla-DMZ-LH
    cp -R $startdir/src/Vanilla-DMZ-LH/cursors $startdir/pkg/usr/share/icons/Vanilla-DMZ-LH/cursors
    # install -Dm644 $startdir/src/Vanilla-DMZ/index.theme $startdir/pkg/usr/share/icons/Vanilla-DMZ/index.theme
    # install -Dm644 $startdir/src/Vanilla-DMZ/COPYING $startdir/pkg/usr/share/licenses/xcursor-vanilla-dmz/COPYING
}


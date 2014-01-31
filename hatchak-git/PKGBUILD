# Maintainer:  William Hatch <willghatch <at> gmail {dot} com>
arch=(any)
pkgname=hatchak-git
pkgver=20140130
pkgrel=1
pkgdesc="Modified Dvorak keyboard layout emphasizing modifiers, implemented in XKB"
license=('BSD')
url="http://github.com/willghatch/hatchak"

depends=()
makedepends=('git')
conflicts=()
provides=('hatchak')
install=hatchak.install

_gitroot=https://github.com/willghatch/hatchak.git
_gitname=hatchak

source=()
md5sums=()

build() {
    cd $srcdir
    
    if [ -d $srcdir/$_gitname ]
    then
        cd $_gitname && git pull origin
        msg "Local files updated"
    else
        git clone $_gitroot
    fi

    install -D -m644 $srcdir/hatchak/xkb/types/hatchak $pkgdir/usr/share/X11/xkb/types/hatchak
    install -D -m644 $srcdir/hatchak/xkb/symbols/hatchak $pkgdir/usr/share/X11/xkb/symbols/hatchak

    
}


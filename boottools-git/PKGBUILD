# Maintainer: Marcello Mortaro <mortaromarcello@gmail.com>
pkgname=boottools-git
pkgver=20120717
pkgrel=1
pkgdesc="Tools for unpacking and repacking android boot.img."
arch=('any')
url="https://github.com/AndroidRoot/BootTools"
license=('GPL')
groups=('system')
depends=('git')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'
_giturl="git://github.com/AndroidRoot/BootTools.git"
_name="BootTools"

build() {
    cd "$srcdir"
    if [ -d $_name ]; then
	rm -rf $_name
    fi
    git clone $_giturl
    cd $_name
    make
}

package() {
    cd "$srcdir/$_name"
    mkdir -p $pkgdir/usr/bin
    cp bootunpack hdrboot mkbootimg unpack-bootimg.sh $pkgdir/usr/bin
}
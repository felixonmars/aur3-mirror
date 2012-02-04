# Contributor: Corali Signs Co. <coralisigns[at]gmail(dot)com>
pkgname=eurocalc-git
pkgver=1.0
pkgrel=1
pkgdesc="A very simple app to convert Euros to Greek Drachmas and vice versa."
arch=('i686' 'x86_64')
url="git://gitorious.org/eurocalc/kyr-corali.git"
license=('LGPL')
groups=()
depends=('cairo' 'libgnomeui' 'freetype2')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()

_gitroot=git://gitorious.org/eurocalc/kyr-corali.git
_gitname=kyr-corali

build() {
cd $startdir/src
git clone $_gitroot

cp -r $_gitname $_gitname-build
cd $_gitname
./autogen.sh
./configure --prefix=/usr
make || return 1
make DESTDIR=${startdir}/pkg install || return 1
rm -rf $startdir/src/$_gitname-build
}


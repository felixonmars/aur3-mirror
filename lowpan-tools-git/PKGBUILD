# Maintainer: 
pkgname=lowpan-tools-git
pkgver=20111110
pkgrel=1
pkgdesc="Base programs for LoWPAN in Linux, the net-tools for LoWPAN (with 6Lowpan support)"
arch=('i686' 'x86_64')
url="http://linux-zigbee.git.sourceforge.net/git/gitweb.cgi?p=linux-zigbee/linux-zigbee;a=summary"
license=('GPLv2')

depends=()
makedepends=(git)
optdepends=()
provides=()
conflicts=()
replaces=()

source=('python2_compatibility.patch'
	'6lowpan_support.patch')

md5sums=('2717be4f860beac028443a0b7a078236'
	 'f1a5c5c172c26fb318727bdbf3eb94e1')

_gitroot=git://linux-zigbee.git.sourceforge.net/gitroot/linux-zigbee/linux-zigbee

_gitname=linux-zigbee

build() {
cd "$srcdir"

msg "Connecting to $_gitroot..."

if [[ -d $_gitname ]]; then

cd $_gitname && git pull origin && cd ..

msg2 "Local files updated"

else

git clone $_gitroot

msg2 "Git checkout done"

fi

rm -rf $_gitname-build

git clone $_gitname $_gitname-build

cd $_gitname-build

patch -Np1 -i "${srcdir}/python2_compatibility.patch"

patch -Np1 -i "${srcdir}/6lowpan_support.patch"

msg "Starting autoreconf..."

./autogen.sh

msg "Starting configure..."

./configure --enable-shared --disable-werror PYTHON="/usr/bin/python2"

msg "Starting make..."

make

}

package() {

cd "$srcdir/$_gitname-build"

make install DESTDIR="$pkgdir"


}

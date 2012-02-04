# Maintainer: Jan-Niklas Meier <dschanoeh@googlemail.com>
pkgname=can-modules-git
pkgver=20111210
pkgrel=1
pkgdesc="SocketCAN kernel modules"
arch=('i686' 'x86_64')
url="https://gitorious.org/linux-can/can-modules"
license=('GPLv2')
groups=()
depends=()
makedepends=(git sed linux-headers)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=can-modules.install
changelog=
source=()
noextract=()
md5sums=()

_gitroot=https://git.gitorious.org/linux-can/can-modules.git
_gitname=can-modules

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

msg "Disabling mcp251x module..."

sed 's/export CONFIG_CAN_MCP251X/#export CONFIG_CAN_MCP251X/g' $srcdir/$_gitname-build/Makefile > $srcdir/$_gitname-build/Makefilenew
mv $srcdir/$_gitname-build/Makefilenew $srcdir/$_gitname-build/Makefile

msg "Starting make..."
make
}

package() {
cd "$srcdir/$_gitname-build"
mkdir -p $pkgdir/lib/modules/$(uname -r)/build
mkdir -p $pkgdir/lib/modules/$(uname -r)/extra/drivers/net/can/sja1000
mkdir -p $pkgdir/lib/modules/$(uname -r)/extra/drivers/net/can/cc770
mkdir -p $pkgdir/lib/modules/$(uname -r)/extra/net/can

cd $srcdir/$_gitname-build/drivers/net/can
cp *.ko $pkgdir/lib/modules/$(uname -r)/extra/drivers/net/can/
cd $srcdir/$_gitname-build/drivers/net/can/sja1000
cp *.ko $pkgdir/lib/modules/$(uname -r)/extra/drivers/net/can/sja1000/
cd $srcdir/$_gitname-build/drivers/net/can/cc770
cp *.ko $pkgdir/lib/modules/$(uname -r)/extra/drivers/net/can/cc770/
cd $srcdir/$_gitname-build/net/can
cp *.ko $pkgdir/lib/modules/$(uname -r)/extra/net/can/
}

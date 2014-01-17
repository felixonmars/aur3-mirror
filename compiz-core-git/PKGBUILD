# Maintainer: Baraa Chiet <baraa.ch.95@gmail.com>

pkgname=compiz-core-git
pkgver=0.8.X
pkgrel=1
pkgdesc="Compiz core components from Github."
url="https://github.com/wes1138/compiz-core"
license=('GPL' 'LGPL' 'MIT')
arch=('i686' 'x86_64')
depends=('startup-notification' 'librsvg' 'dbus' 'glu' 'libxslt' 'libxrandr' 'libsm' 'libxcomposite' 'libxinerama')
makedepends=("intltool" "gconf" "libice" "git")
options=(!libtool !emptydirs)
conflicts=("compiz" "compiz-core" "compiz-core" "compiz-git")
source=("git://github.com/wes1138/compiz-core.git")
md5sums=("SKIP")

build()
{
  cd $srcdir/compiz-core

./autogen.sh
./configure
make && make install
}

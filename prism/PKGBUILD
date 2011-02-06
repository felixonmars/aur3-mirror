# Contributed by: realtek <aron.stachecki@gmail.com>
# Contributor: gDD <gDD [on] irc.freenode.net> based on realtek's
pkgname=prism
pkgver=1.0b4
pkgrel=1
pkgdesc="Prism is a simple XULRunner based browser that hosts web applications without the normal web browser user interface."
arch=('i686')
url="http://prism.mozilla.com/"
license=('MPL' 'GPL' 'LGPL')
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=('prism-0.9')
replaces=()
backup=()
options=()
install=
source=('http://prism.mozillalabs.com/downloads/1.0b4/prism-1.0b4.en-US.linux-i686.tar.bz2')
noextract=()
md5sums=('cf1fc7c191e45a7619d371b0c295c3cb')

# thank andrew9888 and fluke
build() {
cd $startdir/src/$pkgname
mkdir -p $startdir/pkg/opt/prism
mkdir -p $startdir/pkg/usr/bin
echo "/opt/prism/prism \"\$@\"" > $startdir/pkg/usr/bin/prism
chmod +x $startdir/pkg/usr/bin/prism
cp -R * $startdir/pkg/opt/prism/
}

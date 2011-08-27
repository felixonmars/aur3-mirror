# Contributed by: realtek <aron.stachecki@gmail.com>

pkgname=prism-0.9
pkgver=0.9
pkgrel=2
pkgdesc="Prism is a simple XULRunner based browser that hosts web applications \
	without the normal web browser user interface. "
url="https://wiki.mozilla.org/Prism"
depends=()
makedepends=()
license=('Unknown')
conflicts=()
replaces=()
arch=(i686)
install=
source=(http://people.mozilla.com/%7Emfinkle/prism/prism-0.9.en-US.linux-i686.tar.bz2)
md5sums=("3ea7ab1fe97231ba73881509da0e6d3a")

# thank andrew9888 and fluke
build() {
cd $startdir/src/$pkgname
mkdir -p $startdir/pkg/opt/prism
mkdir -p $startdir/pkg/usr/bin
cp -R * $startdir/pkg/opt/prism/
cd $startdir/pkg/usr/bin
ln -s ../../opt/prism/prism ./prism
echo "Good luck"
}

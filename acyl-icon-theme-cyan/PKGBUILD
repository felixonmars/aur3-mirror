pkgname=acyl-icon-theme-cyan
pkgver=1
pkgrel=1
pkgdesc="A nice icon theme cyan outline"
arch=('any')
url="https://plus.google.com/104103936766014612225/posts/Nv2QaMjcidt"
license=('unknown')
depends=()
makedepends=()
source=()
md5sums=()

build() {
wget -O $pkgname.tar https://dl.dropboxusercontent.com/s/ekar0vk8lne3p0d/archive.tar?dl=1
tar -xf $pkgname.tar
cd $srcdir/
install -d $pkgdir/usr/share/icons/
cp -R ACYL_Icon_Theme_0.9.4v2 $pkgdir/usr/share/icons/
chmod -R 755 $pkgdir/usr/share/icons/
}

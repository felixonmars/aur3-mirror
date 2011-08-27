#Contributor: Shaika-Dzari <shaikadzari@gmail.com>

pkgname=crystalgimp
pkgver=1.0
pkgrel=4
pkgdesc="A Crystal theme for The GIMP."
arch=(i686 x86_64)
url="http://www.kde-look.org/content/show.php?content=27772"
license="GPL"
depends=(gimp)
install=crystalgimp.install
source=("http://www.kde-look.org/CONTENT/content-files/27772-Crystalgimp.tar.gz")
md5sums=('8581a2066819a1dbe3953bbf3c40aaea')

build() {
  cd $startdir/src/Crystalgimp
  echo "version-1.0-333" >> VERSION
  mkdir -p $startdir/pkg/usr/share/gimp/2.0/themes/
  cp -r Crystal $startdir/pkg/usr/share/gimp/2.0/themes/Crystal
  install $startdir/src/Crystalgimp/VERSION $startdir/pkg/usr/share/gimp/2.0/themes/Crystal/VERSION
}

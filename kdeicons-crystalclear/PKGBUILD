# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=kdeicons-crystalclear
pkgver=20050623
pkgrel=3
pkgdesc="KDE icon theme from Everaldo's Crystal icon theme family"
arch=(i686 x86_64)
url="http://www.kde-look.org/content/show.php?content=25668"
license="LGPL"
source=(http://linuxcult.com/crystal/icons/CrystalClear.tar.gz)
md5sums=('adb7962b585c8ad12adc3b82246edb35')

build() {
  cd ${startdir}/src/
  mkdir -p ${startdir}/pkg/opt/kde/share/icons
  mv Crystal\ Clear ${startdir}/pkg/opt/kde/share/icons/crystalclear
}

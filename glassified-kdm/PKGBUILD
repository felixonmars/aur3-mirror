# Contributor: TryA <tryagainprod@gmail.com>
# Contributor: Marius Dransfeld <marius.dransfeld@googlemail.com>

pkgname=glassified-kdm
pkgver=1.2.1
pkgrel=1
pkgdesc="A KDM theme based on the Glassified Plasma theme"
url="http://kde-look.org/content/show.php/Glassified+KDM?content=99841"
arch=('i686' 'x86_64')
license=('LGPL')
source=("http://trya.alwaysdata.net/linux/Glassified-KDM.tar.gz")
md5sums=('dd98532241af0f10793921814ae50039')

build() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/usr/share/apps/kdm/themes
  mv Glassified ${pkgdir}/usr/share/apps/kdm/themes
}

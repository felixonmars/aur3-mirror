# Contributor: John Ray <localizator@ukr.net>
pkgname=ronak-plasmatheme
pkgver=1
pkgrel=0
pkgdesc="Ronak Plasma Theme from latest Chakra build."
arch=('any')
url="http://www.chakra-linux.org/"
license=('GPL')
depends=('kdelibs' 'kdebase-workspace')
groups=('kde')
source=("${pkgname}-${pkgver}.${pkgrel}.tar.gz::http://ualinux.googlecode.com/files/ronak-plasmatheme-1.0.tar.gz")
md5sums=('44ccb5721f624869138385a684ef5dae')

build()
{
  mkdir -p $startdir/pkg/usr/share/apps/desktoptheme
  cd $startdir/src
  cp -R RONAK $startdir/pkg/usr/share/apps/desktoptheme
}
# Contributor: Jul1 <julien@h-inventory.com>

pkgname=hinventory-server
pkgver=0.7
pkgrel=1
pkgdesc="Web-based hardware/software inventory management for Windows, Linux, BSD computers. H-Inventory provides incident and intervention management, user and network management, network maps, services monitoring and application deployment."
url="http://www.h-inventory.com/"
license="GPL"
depends=(apache php mysql)
source=(http://ovh.dl.sourceforge.net/sourceforge/h-inventory/hinventoryBeta7.tar.gz)
md5sums=('2E49B96228283DC4F0221B21BD59F8BB')
build() {
  tar zxvf hinventoryBeta7.tar.gz 
  cd $startdir/src/hinventory/
  mkdir -p $startdir/pkg/home/httpd/html/hinventory
  cp -R * $startdir/pkg/home/httpd/html/hinventory
  chown -R nobody $startdir/pkg/home/httpd/html/hinventory
}

# Contributor: Nelson Menon <nelsonmenon@gmail.com insanatorium.wordpress.com>

pkgname=nexmappack
pkgver=2.0
pkgrel=1
pkgdesc="Community map pack for Nexuiz"
arch=('i686' 'x86_64')
url="http://www.nexuiz.com"
license=('GPL')
depends=('nexuiz')
makedepends=('unzip')
source=(http://downloads.sourceforge.net/nexuiz/nexmappack_r2.zip)
md5sums=(e881e78e02e5e97c7c453192aab58f7d)

build()	{
  mkdir -p $startdir/pkg/opt/nexuiz
  cp -r $startdir/src/data $startdir/pkg/opt/nexuiz
}

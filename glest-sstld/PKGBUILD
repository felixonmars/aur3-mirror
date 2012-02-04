# Contributor: Tomas Groth <tomasgroth@yahoo.dk>
pkgname=glest-sstld
pkgver=2.1
pkgrel=1
pkgdesc="Starship Tropper: Last Defense - mod for glest"
arch=(i686 x86_64)
url="http://mods.moddb.com/5862/sstld/"
depends=('glest')
makedepends=()
conflicts=()
license="GPL"
source=(SST2_1Friendly.zip)
md5sums=('ed6f529c303ef613809dc42e3646fbd4')

# You have to download SST2_1Friendly.zip from 
# http://www.moddb.com/mods/5862/sstld/downloads (Base Files).
# It can't be done automaticly because of the server the file is on.

build() {
  mkdir -p $startdir/pkg/opt/glest
  cd $startdir/pkg/opt/glest
  cp -r $startdir/src/{maps,scenarios,techs,tilesets} .  
}

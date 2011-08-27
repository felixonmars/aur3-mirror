# Contributor: Tomas Groth <tomasgroth@yahoo.dk>
pkgname=glest-domineonic
pkgver=0.1
pkgrel=1
pkgdesc="Domineonic - mod for glest"
arch=(i686 x86_64)
url="http://www.moddb.com/mods/10252/demonionic"
depends=('glest' 'glest-data')
makedepends=()
conflicts=()
license="GPL"
source=(Domineonic.zip)
md5sums=('30a3058ab7e596226b0f33bfa4ff6711')

# You have to download Domineonic.zip from 
# http://www.moddb.com/mods/10252/demonionic/downloads (Demonionic-update).
# It can't be done automaticly because of the server the file is on.

build() {
  mkdir -p $startdir/pkg/opt/glest/{maps,scenarios}
  cd $startdir/pkg/opt/glest
  cp -r $startdir/src/Domineonic/maps/{BigLand.gbm,FourKingdoms.gbm,MovingInland.gbm,fight*,open_field.gbm,the_ruins.gbm} maps/
  cp -r $startdir/src/Domineonic/scenarios/Napoleon1.xml scenarios/
  cp -r $startdir/src/Domineonic/techs .

  # Fix scenario file
  cd $startdir/pkg/opt/glest/scenarios/
  sed -i -e 's#<scenario>#<scenario><difficulty value="2"/>#' Napoleon1.xml
}

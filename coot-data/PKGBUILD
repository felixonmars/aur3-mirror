# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=coot-data
pkgver=24072013
pkgrel=1
_refmacver=5.41
pkgdesc="Crystallographic Object-Oriented Toolkit for model building, completion and validation - Data files"
arch=('i686' 'x86_64')
url="http://lmb.bioch.ox.ac.uk/coot/"
license=('GPL')
depends=('coot')
source=(http://www2.mrc-lmb.cam.ac.uk/groups/murshudov/content/refmac/Dictionary/refmac_dictionary_v$_refmacver.tar.gz
        http://www2.mrc-lmb.cam.ac.uk/personal/pemsley/coot/dependencies/reference-structures.tar.gz)
sha256sums=('8cb5ffeb6ae844f76284ee23db4ca0c2455f5f5553e6d60e6a0b6ed558940953'
            '44db38506f0f90c097d4855ad81a82a36b49cd1e3ffe7d6ee4728b15109e281a')
package() {

  install -d $pkgdir/usr/share/coot/reference-structures
  install -Dm644 $srcdir/reference-structures/*.pdb $pkgdir/usr/share/coot/reference-structures/
  
  install -d $pkgdir/usr/share/coot/lib/data/monomers
  cp -r $srcdir/monomers/* $pkgdir/usr/share/coot/lib/data/monomers/
} 

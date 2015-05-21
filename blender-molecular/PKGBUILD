# Maintainer: aquarius <aquarius24@yandex.ru>
# Contributor: Jean-Francois Gallant <http://pyroevil.com/category/scripts-addons/molecular-script/>

pkgname=blender-molecular
pkgver=1.02
pkgrel=1

pkgdesc="This is Blender Molecular Script. This script globally do two things: self collision and particles links."

arch=('i686' 'x86_64')

url="http://pyroevil.com/category/scripts-addons/molecular-script/"

license=('GPL')

depends=('blender')
makedepends=('unzip')
conflicts=()

noextract=("${source[@]%%::*}")

source_x86_64=("http://pyroevil.com/?wpdmdl=688")
source_i686=("http://pyroevil.com/?wpdmdl=687")

md5sums_i686=('SKIP')
md5sums_x86_64=('SKIP')

pkgver() {
  
  cd $srcdir
  if [ "$CARCH" = "i686" ]; then
    unzip molecular_vlinux32  
  elif [ "$CARCH" = "x86_64" ]; then
    unzip molecular_vlinux64
  fi

}

#build() {
#}

package() {
  _blender_ver=$(blender -v | head -n 1 | awk '{print $2}')
  mkdir -p "$pkgdir/usr/share/blender/$_blender_ver/scripts/addons/molecular"
  cp molecular/* "$pkgdir/usr/share/blender/$_blender_ver/scripts/addons/molecular"
}


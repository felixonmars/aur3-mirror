pkgname=unity-asset-pool-bzr
pkgver=53
pkgrel=2
pkgdesc="Design assets for Unity"
arch=('i686' 'x86_64')
url="http://launchpad.net/unity-asset-pool"
license=('GPL')
depends=('gnome-icon-theme')
source=(user-trash-full.png
	user-trash.png
	trash.svg)
makedepends=('bzr')
conflicts=('unity-asset-pool')
replaces=('unity-asset-pool')
groups=('unity2d-bzr')
md5sums=('eab30d50daaca7a150954abe0d48077a'
         '67907158ec06873ed5b72ca0076678f1'
         'cdf1a19d917bfadb0386ac1fdfbcebdc')

_bzrtrunk=lp:unity-asset-pool
_bzrmod=unity-asset-pool

build() {
  cd "$srcdir"
  if [ -d ${_bzrmod} ]; then
  bzr up ${_bzrmod}
    msg "The local files are updated."
  else
    bzr co ${_bzrtrunk} ${_bzrmod}
  fi
}

package() { 
  cd ${srcdir}/${_bzrmod}
  mkdir -p $pkgdir/usr/share/unity/themes
  cp -r launcher/* $pkgdir/usr/share/unity/themes
  cp -r panel/* $pkgdir/usr/share/unity/themes
  mkdir -p $pkgdir/usr/share/icons
  cp -r unity-icon-theme $pkgdir/usr/share/icons
  cp ${srcdir}/*.png ${pkgdir}/usr/share/icons/unity-icon-theme/places/48/
  cp ${srcdir}/trash.svg ${pkgdir}/usr/share/icons/unity-icon-theme/places/svg/
}
 

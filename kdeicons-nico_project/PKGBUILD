# Contributor: Krzysztof Raczkowski <raczkow@gmail.com>

pkgname=kdeicons-nico_project
_pkgname=NiCo_Project
pkgver=1.0
pkgrel=3
pkgdesc="Complete system icon set for KDE"
arch=('i686' 'x86_64')
url='http://www.kde-look.org/content/show.php/NiCo_Project?content=55749'
license=('GPL')
makedepends=('imagemagick')
source=("http://fc09.deviantart.net/fs14/f/2007/108/8/c/${_pkgname}_by_hammergom.zip")
md5sums=('489108737dd78516a0f689eac7141fe0')

SIZES="128x128 96x96 72x72 64x64 48x48 32x32 22x22 16x16"
DIRS="actions apps devices filesystems mimetypes"

build() {
  cd ${startdir}/src/NiCo_Crystal
#sh buildset

# create the dirs
  for size in $SIZES; do
    for dir in $DIRS; do
      mkdir -pm 755 $size/$dir
    done
  done
  msg2 "Convert icons..."
  for dir in $DIRS; do
    cd 128x128/$dir
    for icon in *; do
# Loop the specified sizes
	for size in $SIZES; do
	  convert "$icon" -resize $size ../../$size/$dir/"$icon"
	 done
    done
    cd ../../
  done
}

package() {
  install -dm 755 ${pkgdir}/usr/share/icons/${_pkgname}
  install -Dm 644 ${startdir}/src/NiCo_Crystal/index.desktop ${pkgdir}/usr/share/icons/${_pkgname}/index.desktop
  for size in $SIZES; do
    cp -r ${srcdir}/NiCo_Crystal/${size} ${pkgdir}/usr/share/icons/${_pkgname}
  done
}

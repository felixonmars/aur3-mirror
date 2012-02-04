 
# Maintainer: Artem A. Klevtsov unikum.pm@gmail.com
pkgname=kdeicons-reflections-kde4
pkgver=1.0
pkgrel=1
pkgdesc="This is a version of the KDE4 port of the "Reflektions" icons."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Reflektions_KDE4?content=110944"
license=('CC BY-NC-SA 3.0')
makedepends=('imagemagick' 'unrar')
source=('http://fc04.deviantart.net/fs70/f/2011/189/0/3/reflektions_kde4_v1_0_by_linuxfever-d287xmx.rar')
md5sums=('9a17d11b61edac9b35f20b1e487bc58a')

build() {
  cd ${srcdir}
  msg "Extract files..."
  unrar x -inul reflektions_kde4_v1_0_by_linuxfever-d287xmx.rar
  cd ${srcdir}/Reflektions_KDE4
  SIZES="8x8 16x16 22x22 24x24 32x32 48x48 64x64 96x96"
  DIRS="actions apps categories devices emblems emotes mimetypes places status" 

# create the dirs
  for size in $SIZES
  do
	for dir in $DIRS
	do
		mkdir -p $size/$dir
	done
  done

  msg "Convert icons..."
  for dir in $DIRS
  do
	cd ${srcdir}/Reflektions_KDE4/128x128/$dir
	for icon in *
	do
		for size in $SIZES
		do
			convert "$icon" -resize $size ../../$size/$dir/"$icon"
		done
	done
  done
}

package() {
  mkdir -p ${pkgdir}/usr/share/icons/Reflektions_KDE4
  cp ${srcdir}/Reflektions_KDE4/index.theme ${pkgdir}/usr/share/icons/Reflektions_KDE4
  cp -r ${srcdir}/Reflektions_KDE4/128x128 ${pkgdir}/usr/share/icons/Reflektions_KDE4

  for size in $SIZES
  do
	cp -r ${srcdir}/Reflektions_KDE4/$size ${pkgdir}/usr/share/icons/Reflektions_KDE4
  done

  cp -r ${srcdir}/Reflektions_KDE4/48x48_or ${pkgdir}/usr/share/icons/Reflektions_KDE4/48x48
  cp -r ${srcdir}/Reflektions_KDE4/32x32_or ${pkgdir}/usr/share/icons/Reflektions_KDE4/32x32
  cp -r ${srcdir}/Reflektions_KDE4/22x22_or ${pkgdir}/usr/share/icons/Reflektions_KDE4/22x22
  cp -r ${srcdir}/Reflektions_KDE4/16x16_or ${pkgdir}/usr/share/icons/Reflektions_KDE4/16x16
  cp -r ${srcdir}/Reflektions_KDE4/8x8_or ${pkgdir}/usr/share/icons/Reflektions_KDE4/8x8
}

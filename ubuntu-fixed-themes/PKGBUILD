# Maintainer: agnotek <agnostic [DOT] sn [AT] gmail [DOT] com>

pkgname=ubuntu-fixed-themes
pkgnameorg=ubuntu-themes
_actual_ver=14.04
_extra_ver=+15.04.20141217
pkgver=${_actual_ver}${_extra_ver/\+/.}
pkgrel=1
pkgdesc="Ubuntu monochrome icon theme, Ambiance and Radiance themes, and Ubuntu artwork using the fix from Leo Iannacone"
arch=(any)
url="https://launchpad.net/ubuntu-themes"
license=(CCPL)
groups=(unity-extra)
depends=(humanity-icon-theme gnome-icon-theme hicolor-icon-theme
         gtk-engine-unico gtk-engine-murrine)
makedepends=(python2 imagemagick icon-naming-utils)
provides=(light-themes ubuntu-mono)
conflicts=(light-themes ubuntu-mono)
install=${pkgnameorg}.install
source=(https://launchpad.net/ubuntu/+archive/primary/+files/${pkgnameorg}_${_actual_ver}${_extra_ver}.orig.tar.gz
	fix-gnome-shell.patch)
md5sums=('6a30222639756f798354bf56965bebf0'
	 '019de6ba71ed5b6c685c4a65c89b7017')

build() {
  cd "${pkgnameorg}-${_actual_ver}${_extra_ver}"

  # Python 2 fix
  sed -i 's|^\(#!.*python$\)|\12|g' scavenge.py

  # Patch
#  cd "$srcdir/${pkgnameorg}-${_actual_ver}${_extra_ver}"
#  patch -Np0 -i ../fix-gnome-shell.patch

  make
}

package() {
  cd "${pkgnameorg}-${_actual_ver}${_extra_ver}"

  # Install themes
  install -dm755   "${pkgdir}/usr/share/themes/"
  cp -av Ambiance/ "${pkgdir}/usr/share/themes/"
  cp -av Radiance/ "${pkgdir}/usr/share/themes/"

  # Install icons
  install -dm755            "${pkgdir}/usr/share/icons/"
  cp -av ubuntu-mono-dark/  "${pkgdir}/usr/share/icons/"
  cp -av ubuntu-mono-light/ "${pkgdir}/usr/share/icons/"
  cp -av LoginIcons/        "${pkgdir}/usr/share/icons/"
  cp -av suru-icons/        "${pkgdir}/usr/share/icons/"
  cp -av ubuntu-mobile/     "${pkgdir}/usr/share/icons/"

  mv "${pkgdir}"/usr/share/icons/{suru-icons,suru}/

  install -Dm644 distributor-logo.png \
    "${pkgdir}/usr/share/icons/hicolor/48x48/apps/distributor-logo.png"
}

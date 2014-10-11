# Maintainer: agnotek <agnostic.sn AT gmail.com>

pkgname=ubuntu-themes-cinnamon
pkgnameorg=ubuntu-themes
_actual_ver=14.04
_extra_ver=+14.10.20140929
pkgver=${_actual_ver}.14.10.20140929
pkgrel=1
pkgdesc="Ubuntu monochrome icon theme, Ambiance and Radiance themes, and Ubuntu artwork"
arch=('any')
url="https://launchpad.net/ubuntu-themes"
license=('CCPL')
groups=('unity-extra')
depends=('humanity-icon-theme' 'gnome-icon-theme' 'hicolor-icon-theme' 'gtk-engine-unico' 'gtk-engine-murrine')
makedepends=('python2' 'imagemagick' 'icon-naming-utils')
provides=('light-themes' 'ubuntu-mono')
conflicts=('light-themes' 'ubuntu-mono')
install=${pkgnameorg}.install
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgnameorg}_${_actual_ver}${_extra_ver}.orig.tar.gz")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/${pkgnameorg}-${_actual_ver}${_extra_ver}"

  # Python 2 fix
  sed -i 's|^\(#!.*python$\)|\12|g' scavenge.py

  make
}

package() {
  cd "${srcdir}/${pkgnameorg}-${_actual_ver}${_extra_ver}"

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

# vim:set ts=2 sw=2 et:

# Maintainer : xzy3186 <xzy3186 [at] gmail [dot] com>
#_modify='y'

pkgname=gnome-shell-themes-elegance-colors
pkgver=v3.0
_pkgver=3.0
pkgrel=1
pkgdesc="A chameleon theme for Gnome Shell which can change colors according to the current GTK theme, current wallpaper (uses imagemagick to get color) or a user defined color."
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/satya164/elegance-colors"
depends=( 'gtk3' 'gnome-shell>=3.6' 'glib2' 'imagemagick' 'bc')
makedepends=('vala')
conflicts=('gnome-shell-theme-elegance-colors-git')
install=$pkgname.install

source=("$pkgname-$pkgver.zip::https://github.com/satya164/elegance-colors/archive/${pkgver}.zip")

build() {
  cd ${srcdir}/elegance-colors-${_pkgver}/
  #if [ $_modify = 'y' ]; then
  #   patch -p0 -i ../modify.patch
  #fi
  make
}

package() {
  cd ${srcdir}/elegance-colors-${_pkgver}/
  make DESTDIR=${pkgdir} install
  #if [ $_modify = 'y' ]; then
  #   cd ${srcdir}
  #   cp start{1,2}.png ${pkgdir}/usr/share/elegance-colors/templates/gs-3.10/
  #fi
  #cd ${pkgdir}
  #sed -i "s|Icon=elegance-colors|Icon=/usr/share/icons/hicolor/scalable/apps/elegance-colors.svg|g" usr/share/applications/elegance-colors-prefs.desktop
}

sha256sums=('3d5d222fa67a86031e93fb7b937cade7ab12e8e45fc94cde92f498909c210045')

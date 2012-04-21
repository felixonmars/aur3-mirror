# Maintainer: graysky
# Contributor: John Gerritse <reaphsharc@gmail.com>

pkgname=celtx
pkgver=2.9.7
_pkgver=$(echo $pkgver| sed 's/\./-/g') # source does not contain . it contains -
pkgrel=1
pkgdesc="Combines full-feature scriptwriting with pre-production support and online collaboration."
url="https://www.celtx.com/desktoplicense.html"
arch=(any)
license=(CePL) 
depends=(zip unzip freetype2 fontconfig pkg-config gtk2 dbus-glib iw libidl2 python2 alsa-lib curl libnotify libxt mesa autoconf2.13 yasm)
conflicts=('celtx-bin')
source=(http://download.$pkgname.com/source/$pkgname-$_pkgver-src.tar.bz2)
build() {
  
	cd "$srcdir"/$pkgname-$_pkgver-src/mozilla
  install mozconfig-nodebug-linux.in .mozconfig
  PYTHON=python2 make -f client.mk build

	# note build is broken here

	make -C ../objdir/celtx/installer
  mkdir -p "${pkgdir}"/usr/share
  bsdtar -xf "${_basedir}"/objdir/dist/celtx*.en-US.linux-${CARCH}.tar.bz2 -C "${pkgdir}"/usr/share
  mkdir -p "${pkgdir}"/usr/share/applications
  #DESKTOPFILE="${pkgdir}"/usr/share/applications/brosix.desktop
  #echo "[Desktop Entry]" > "${DESKTOPFILE}"
  #echo "Name=Celtx" >> "${DESKTOPFILE}"
  #echo "Comment=Solution for media pre-production and collaboration" >> "${DESKTOPFILE}"
  #echo "Exec=/usr/share/celtx/celtx" >> "${DESKTOPFILE}"
  #echo "Icon=/usr/share/celtx/icons/default48.png" >> "${DESKTOPFILE}"
  #echo "Type=Application" >> "${DESKTOPFILE}"
  #echo "Terminal=false" >> "${DESKTOPFILE}"
  #echo "Categories=Office;" >> "${DESKTOPFILE}"
}

sha256sums=('6232b6f1d3ac05bd413a0fe8f7a41dd7262140d479c9e834651308b8759289da')

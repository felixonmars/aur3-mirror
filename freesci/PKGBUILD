# Contributor: Thorsten Hirsch <t.hirsch@web.de>
# Contributor: Nathaniel Roark <robb_force@holybuffalo.net>

pkgname=freesci
pkgver=0.6.4
pkgrel=1
pkgdesc="Free reimplementation of the Sierra Creative Interpreter (SCI)."
url="http://freesci.linuxgames.com/"
license=('GPL')
arch=('i686')
depends=('sdl' 'alsa-lib' 'fontconfig' 'libxi' 'libxinerama' 'libpng' 'tk')
source=(http://www-plan.cs.colorado.edu/creichen/${pkgname}/${pkgname}-${pkgver}.tar.gz \
  freesci.desktop)
install=${pkgname}.install
md5sums=('6a551d0aa7a257e08089bf15c0844961'
         '74a99b97db8d419421be4ae7943227f2')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  sed -e "/^SUBDIRS/ s/conf debian//" -i Makefile.in
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install

  # Manually install the config tool and config template (uses Tcl/Tk)
  sed -e 's|/usr/local/share/games/freesci/config.template|/usr/local/share/freesci/config.template|' \
    -e 's|/usr/share/games/freesci/config.template|/usr/share/freesci/config.template|' \
    -i conf/${pkgname}-setup
  install -m755 conf/${pkgname}-setup ${startdir}/pkg/usr/bin/${pkgname}-setup
  install -Dm644 conf/config.template ${startdir}/pkg/usr/share/${pkgname}/config.template
  
  # Install an Arch desktop entry
  install -Dm644 ${startdir}/src/freesci.desktop \
    ${startdir}/pkg/usr/share/applications/freesci.desktop
  rm -R ${startdir}/pkg/usr/share/applnk
}

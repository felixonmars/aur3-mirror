# Contributor irgal <irgal@fird.net>

pkgname=mlterm-iiimf
_realname=mlterm
pkgver=2.9.4
pkgrel=1
pkgdesc="Multilingual terminal emulator with iiimf support"
arch=(i686 x86_64)
license=('GPL2')
depends=('fribidi' 'gtk2' 'libsm')
makedepends=('intltool' 'librsvg' 'ncurses' 'm17n-lib' 'scim')
provides=('mlterm')
conflicts=('mlterm')
options=(!libtool)
source=(http://dl.sourceforge.net/sourceforge/${_realname}/${_realname}-${pkgver}.tar.gz \
        ${_realname}.desktop)
url="http://mlterm.sourceforge.net/"
md5sums=('67fc33f09da045f86b0d4ceebed76aac' '91f72887c0c58ba58e806bb8cc753d56')

build() {
  cd ${startdir}/src/${_realname}-${pkgver}
 # build
  ./configure --prefix=/usr \
    --libexecdir=/usr/lib/mlterm --sysconfdir=/etc --mandir=/usr/share/man \
    --enable-fribidi --enable-optimize-redrawing --enable-utmp \
    --enable-scim --enable-m17nlib --disable-static \
    --with-tools=mlconfig,mlterm-zoom,mlterm-menu,mlclient \
    --with-imagelib=gdk-pixbuf --with-type-engines=xcore,xft \
    --enable-anti-alias --enable-iiimf
  make || return 1
  make DESTDIR=${startdir}/pkg install
  echo 'conf_menu_path_2 = mlterm-zoom' >> ${startdir}/pkg/etc/mlterm/main
 # install some freedesktop.org compatibility
  install -D -m644 ${startdir}/src/${_realname}.desktop \
   ${startdir}/pkg/usr/share/applications/${_realname}.desktop
  sed -e 's:mlterm:mlclient:' \
   < ${startdir}/pkg/usr/share/applications/${_realname}.desktop \
   > ${startdir}/pkg/usr/share/applications/mlclient.desktop
  install -D -m644 contrib/icon/${_realname}-icon.svg \
   ${startdir}/pkg/usr/share/pixmaps/${_realname}.svg
  install -D -m644 contrib/icon/${_realname}-icon-trans.svg \
   ${startdir}/pkg/usr/share/pixmaps/mlclient.svg
 # finally we render a png as fallback for not svg aware menu applications
  # Attention: always make sure you check the dimensions of the source-svg,
  # you can read the dimensions via inkscapes export funktion
  cd ${startdir}/pkg/usr/share/pixmaps
  rsvg -w 48 -h 38 -f png mlterm.svg mlterm.png
  rsvg -w 48 -h 38 -f png mlclient.svg mlclient.png
}

# $Id: PKGBUILD,v 1.1 2007/04/17 13:00:43 alexander Exp $
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Added flags needed for extrema by Marcelo Avalos Tejeda <marcelo.avalos@gmail.com>
pkgname=wxgtk-extrema
pkgver=2.6.4
pkgrel=1
pkgdesc="wxGTK 2.6.x with flags needed by extrema"
arch=(i686 x86_64)
license=('LGPL')
depends=('gtk2>=2.10.9' 'mesa')
replaces=('wxgtk-2.6')
conflicts=('wxgtk-2.6')
provides=('wxgtk-2.6')
source=(http://prdownloads.sourceforge.net/wxwindows/wxGTK-${pkgver}.tar.bz2)
url="http://wxwidgets.org"
md5sums=('ce0fd2b425bc98957cf70eea5f154b49')
build() {
  cd ${startdir}/src/wxGTK-${pkgver}
  ./configure --prefix=/usr \
              --with-gtk=2 \
              --with-opengl \
              --with-libpng \
              --with-libjpeg \
              --with-libtiff \
              --with-gnomeprint \
              --enable-unicode \
              --enable-exceptions \
              --enable-htmlhelp \
              --enable-postscript \
              --enable-giff \
              --enable-static \
              --enable-optimize || return 1
  make || return 1
  make -C locale allmo
  make DESTDIR=${startdir}/pkg install || return 1
  cd contrib/src
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  rm -f ${startdir}/pkg/usr/bin/wx-config
  rm -f ${startdir}/pkg/usr/bin/wxrc
  ln -sf /usr/lib/wx/config/gtk2-unicode-release-2.6 ${startdir}/pkg/usr/bin/wx-config-2.6

  rm -rf ${startdir}/pkg/usr/share/bakefile
  find ${startdir}/pkg/usr/share/locale -name wxmsw.mo | xargs rm -f

  for i in ${startdir}/pkg/usr/share/locale/*/LC_MESSAGES/wxstd.mo; do
    NEWNAME=`echo $i | sed -e 's!wxstd.mo!compat-wxstd26.mo!'`;
    mv $i $NEWNAME;
  done
  mv ${startdir}/pkg/usr/share/aclocal/wxwin.m4 \
   ${startdir}/pkg/usr/share/aclocal/wxwin-2.6.m4
}


# Maintainer: Dmitry Korzhevin <dkorzhevin at gmail dot com>

pkgname=gtranslator-stable
pkgver=2.90.7
pkgrel=1
pkgdesc="An enhanced gettext po file editor for the GNOME"
arch=('i686' 'x86_64')
url="http://ftp.acc.umu.se/pub/GNOME/sources/gtranslator/2.90/"
license=('GPL')
depends=('gettext' 'libgnomeui' 'gtkspell' 'gdl' 'libglade' 'gtksourceview2' 'libgda')
makedepends=('intltool>=0.40' 'gnome-doc-utils')
install=$pkgname.install
options=('!libtool')
source=(http://ftp.acc.umu.se/pub/GNOME/sources/gtranslator/2.90/gtranslator-$pkgver.tar.bz2)
md5sums=('84a01cbf4070f3f74bcd162c0c2f3d20')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr --sysconfdir=/etc --disable-schemas-install
  make || return 1
  make DESTDIR=${pkgdir} install

  install -m755 -d ${pkgdir}/usr/share/gconf/schemas || return 1
  gconf-merge-schema ${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas \
    --domain ${pkgname} ${pkgdir}/etc/gconf/schemas/*.schemas || return 1
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas || return 1
}

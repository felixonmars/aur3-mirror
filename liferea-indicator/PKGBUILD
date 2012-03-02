# Maintainer: György Balló <ballogy@freestart.hu>
# Contributor: Eric Bélanger <eric@archlinux.org>

_pkgname=liferea
pkgname=liferea-indicator
pkgver=1.8.0
pkgrel=1
pkgdesc="A desktop news aggregator for online news feeds and weblogs with Messages Indicator support"
arch=('i686' 'x86_64')
url="http://liferea.sourceforge.net/"
license=('GPL')
depends=('gconf' 'libwebkit' 'libnotify' 'libunique' 'json-glib' 'libindicate-gtk2' 'hicolor-icon-theme')
makedepends=('intltool')
provides=("liferea=$pkgver")
conflicts=('liferea')
options=('!libtool' '!emptydirs')
install=liferea.install
source=(http://downloads.sourceforge.net/sourceforge/liferea/liferea-${pkgver}.tar.gz
        libindicate-fix.patch)
sha1sums=('b731e70128130478207e9059fc9ec33ae7d95358'
          '217d72ecdcc0cf15b9799311064c642058d6a7c1')

build() {
  cd "${srcdir}/liferea-${pkgver}"
  patch -Np1 -i "${srcdir}/libindicate-fix.patch"
  sed -i 's/indicate-0.5/indicate-0.6/
          s/indicate-gtk-0.5/indicate-gtk-0.6/' configure

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-schemas-install
  make
}

package() {
  cd "${srcdir}/liferea-${pkgver}"
  make DESTDIR="${pkgdir}" install
  
  install -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${_pkgname}.schemas" "${pkgdir}"/etc/gconf/schemas/*.schemas
  rm -f "${pkgdir}"/etc/gconf/schemas/*.schemas

  mkdir -p "$pkgdir/usr/share/indicators/messages/applications"
  echo '/usr/share/applications/liferea.desktop' > "$pkgdir/usr/share/indicators/messages/applications/liferea"
}

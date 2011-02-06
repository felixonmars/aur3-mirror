pkgname=evince-nognome
_pkgname=evince
pkgver=2.30.3
pkgrel=1
pkgdesc="Evince document viewer without GNOME and D-Bus dependencies"
url="http://projects.gnome.org/evince/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libspectre>=0.2.6' 'gsfonts' 'poppler-glib>=0.14.0' 'libdjvu>=3.5.22' 't1lib' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('gnome-doc-utils>=0.20.1' 'texlive-bin' 'intltool' 'gobject-introspection')
optdepends=('texlive-bin: DVI support')
replaces=('gpdf' 'evince')
conflicts=('evince')
provides=('evince')
groups=('gnome-extra')
install=evince-nognome.install
options=('!libtool' '!emptydirs')
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgname}/2.30/${_pkgname}-${pkgver}.tar.bz2)
sha256sums=('daddd9720bf8fc0156d9a4a5a85485c232393896376707cf7fcedfcbc515732f')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  sed -i /gnome-icon-theme/d configure

  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --libexecdir=/usr/lib/evince \
      --disable-static \
      --enable-pdf --enable-tiff \
      --enable-djvu --enable-dvi \
      --enable-t1lib --enable-pixbuf \
      --enable-comics --enable-impress \
      --enable-introspection \
      --disable-scrollkeeper --disable-nautilus --without-keyring \
      --without-gconf --disable-thumbnailer --disable-previewer \
      --disable-dbus
  make
  make DESTDIR="${pkgdir}" install

  cd ${pkgdir}/usr/share/applications/ || return 1
  sed -i /GNOME-X/d evince.desktop
  sed -i /NoDisplay/d evince.desktop
  sed -i s/"Name=Document Viewer"/"Name=Evince"/ evince.desktop
  sed -i s/"Categories=GNOME;GTK;Graphics;VectorGraphics;Viewer;"/"Categories=Viewer;Office;Graphics;"/ evince.desktop
}

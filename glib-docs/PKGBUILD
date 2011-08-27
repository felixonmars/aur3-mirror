# Maintainer: Aljosha Papsch <papsch.al@googlemail.com>

pkgname=glib-docs
pkgver=2.28.8
pkgrel=3
pkgdesc="Developer documentation for Glib, GIO, GObject (accessible in devhelp)"
arch=("any")
depends=()
license=('GPL')
url="http://developer.gnome.org/glib/stable/"
source=(ftp://ftp.gnome.org/pub/gnome/sources/glib/2.28/glib-${pkgver}.tar.bz2)
sha256sums=('222f3055d6c413417b50901008c654865e5a311c73f0ae918b0a9978d1f9466f')

build() {

  docsdir="${srcdir}/glib-${pkgver}/docs/reference"

  # Create destination dirs
  install -d ${pkgdir}/usr/share/devhelp/books/{glib,gio,gobject}
  install -d ${pkgdir}/usr/share/doc/{glib,gio,gobject}

  # Install documentation to destination
  for doc in glib gio gobject
  do
    install -D -m 644 \
      ${docsdir}/${doc}/html/* \
      ${pkgdir}/usr/share/doc/${doc}
    install -D -m 644 \
      ${docsdir}/${doc}/html/${doc}.devhelp2 \
      ${pkgdir}/usr/share/devhelp/books/${doc}
    # Make it accessible in devhelp
    sed -i "s/<book/<book base=\"\/usr\/share\/doc\/${doc}\"/g" ${pkgdir}/usr/share/devhelp/books/${doc}/${doc}.devhelp2
  done

}

# vim:set ts=2 sw=2 et:

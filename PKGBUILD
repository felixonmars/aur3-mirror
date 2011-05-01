pkgname=gtk3-docs
pkgver=3.1.2
pkgrel=1
pkgdesc="Documentation for gtk3 to be used in devhelp"
arch=("any")
license=('GPL')
url="http://developer.gnome.org/gtk3/stable/"
source=(ftp://ftp.gnome.org/pub/gnome/sources/gtk+/3.1/gtk+-${pkgver}.tar.bz2)
md5sums=('075220fe5770a571de04cb7640586b97')

build() {

  # Create destination dirs
  install -d ${pkgdir}/usr/share/devhelp/books/gtk3
  install -d ${pkgdir}/usr/share/devhelp/books/gdk3
  install -d ${pkgdir}/usr/share/doc/gtk3
  install -d ${pkgdir}/usr/share/doc/gdk3

  # Install documentation to destination
  install -D -m 644 \
    ${srcdir}/gtk+-${pkgver}/docs/reference/gtk/html/* \
    ${pkgdir}/usr/share/doc/gtk3

  install -D -m 644 \
    ${srcdir}/gtk+-${pkgver}/docs/reference/gdk/html/* \
    ${pkgdir}/usr/share/doc/gdk3

  # Install devhelp file so devhelp will actually show the manuals
  install -D -m 644 \
    ${startdir}/gtk3.devhelp2 \
    ${pkgdir}/usr/share/devhelp/books/gtk3

  install -D -m 644 \
    ${startdir}/gdk3.devhelp2 \
    ${pkgdir}/usr/share/devhelp/books/gdk3

}

# vim:set ts=2 sw=2 et:

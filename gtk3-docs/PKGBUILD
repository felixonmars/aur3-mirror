# Maintainer: Jurica Bradaric <jbradaric@gmail.com>
# Contributor: Ali Vakilzade <ali.vakilzade@gmail.com>
# Contributor: Aljosha Papsch <papsch.al@googlemail.com>

pkgname=gtk3-docs
pkgver=3.12.1
pkgrel=1
pkgdesc="Developer documentation for GTK+3 and GDK3"
arch=("any")
depends=()
license=('custom')
url="http://developer.gnome.org/gtk3/stable/"
source=(ftp://ftp.gnome.org/pub/gnome/sources/gtk+/3.12/gtk+-${pkgver}.tar.xz)
sha256sums=('719aae5fdb560f64cadb7e968c8c85c0823664de890c9f765ff4c0efeb0277cd')

build() {
  _docsdir="${srcdir}/gtk+-${pkgver}/docs/reference"
  for _pkg in gtk3 gdk3; do
    sed -i "s/<book/<book base=\"\/usr\/share\/doc\/${_pkg}\"/g" ${_docsdir}/${_pkg%3}/html/${_pkg}.devhelp2
  done
}

package() {
  _docsdir="${srcdir}/gtk+-${pkgver}/docs/reference"

  for _pkg in gtk3 gdk3; do

    install -d ${pkgdir}/usr/share/doc/${_pkg} \
      ${pkgdir}/usr/share/devhelp/books/${_pkg} \
      ${pkgdir}/usr/share/licenses/${pkgname}

    # documentation to docs dir
    install -D -m 644 \
      ${_docsdir}/${_pkg%3}/html/* \
      ${pkgdir}/usr/share/doc/${_pkg}

    # make it accessible in devhelp
    install -D -m 644 \
      ${_docsdir}/${_pkg%3}/html/${_pkg}.devhelp2 \
      ${pkgdir}/usr/share/devhelp/books/${_pkg}

  done

  install -D -m 644 \
    ${_docsdir}/COPYING \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

}

# vim:set ts=2 sw=2 et:

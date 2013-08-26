# Maintainer: Aljosha Papsch <papsch.al@googlemail.com>

pkgname=cairo-docs
pkgver=1.12.14
pkgrel=1
pkgdesc="Developer documentation for Cairo"
arch=("any")
depends=()
license=('LGPL')
url="http://developer.gnome.org/cairo/stable/"
source=(http://cairographics.org/releases/cairo-${pkgver}.tar.xz)
sha1sums=('9106ab09b2e7b9f90521b18dd4a7e9577eba6c15')
_pkg=cairo

package() {
  cd "${srcdir}/${_pkg}-${pkgver}"

  install -d ${pkgdir}/usr/share/doc/${_pkg} \
    ${pkgdir}/usr/share/devhelp/books/${_pkg}

  # documentation to docs dir
  install -D -m 644 \
    doc/public/html/* \
    ${pkgdir}/usr/share/doc/${_pkg}

  # make it accessible in devhelp
  install -D -m 644 \
    doc/public/html/${_pkg}.devhelp2 \
    ${pkgdir}/usr/share/devhelp/books/${_pkg}

  sed -i "s/<book/<book base=\"\/usr\/share\/doc\/${_pkg}\"/g" ${pkgdir}/usr/share/devhelp/books/${_pkg}/${_pkg}.devhelp2
}

# vim:set ts=2 sw=2 et:

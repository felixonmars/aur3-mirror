# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Caelyl <caelyl@gmail.com>

pkgname=mindless
pkgver=1.6
pkgrel=3
pkgdesc="A virtual tabletop for playing card games like Magic: The Gathering"
arch=('i686' 'x86_64')
url="http://mindless.sourceforge.net/"
license=('GPL')
depends=('gtk2')
optdepends=('bash: for mtgspoiler script')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "mtgspoiler.sh")
md5sums=('24304be2f71340a07149fcd5b4791eb1'
         'a286de1154e938d9f4f30ee75eddd1df'
         'bed47113b4fbc721d487d396e3a9ee49')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install a binary
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Install additional files
  echo "oracle_name=/usr/share/${pkgname}/oracle.txt" > mindlessrc
  install -Dm644 mindlessrc "${pkgdir}/usr/share/${pkgname}/mindlessrc"
  install -m755 "../mtgspoiler.sh" "${pkgdir}/usr/bin/mtgspoiler"

  # Install a desktop entry
  install -Dm644 "ICONS/phasecombat.svg" "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 CHANGES README TODO "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:

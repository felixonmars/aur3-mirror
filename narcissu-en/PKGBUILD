# Maintainer: Anton Larionov <diffident dot cat at gmail dot com>

pkgname=narcissu-en
pkgver=1.1
pkgrel=7
pkgdesc="Free japanese visual novel game, translated into English"
arch=('any')
url='http://narcissu.insani.org/'
license=('custom:PFSL' 'custom:freeware')
depends=('onscripter-en' 'sh')

source=('http://narcissu.gwathyr.net/NarcissuSetup%5Binsani+Haeleth%5D.tar.bz2'
        'narcissu-en.sh'
        'narcissu-en.desktop'
        'narcissu-en.png')

md5sums=('725a6168aed4a6a575f014c6e5110fa5'
         'a355b87cc0d518940bceec00cb890747'
         '49eba9ab45fcdd0e643aadd8564f0f63'
         'caeca7f043c9384c89d95c0e8455d41c')

package() {

  # desktop entry, bash script
  install -D -m644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  install -D -m755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"


  # icon, main files, readme, license
  install -D -m644 "${pkgname}.png" "${pkgdir}/usr/share/${pkgname}/icon.png"

  cd "${srcdir}/narcissu_web_edition/"
  install -m644 arc.nsa default.ttf nscript.dat "${pkgdir}/usr/share/${pkgname}/"

  install -D -m644 readme.txt "${pkgdir}/usr/share/doc/${pkgname}/readme.txt"

  install -D -m644 PFSL.txt "${pkgdir}/usr/share/licenses/${pkgname}/PFSL.txt"
}

# vim:set ts=2 sw=2 et:

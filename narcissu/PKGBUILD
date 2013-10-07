# Maintainer: Anton Larionov <diffident dot cat at gmail dot com>

pkgname=narcissu
pkgver=1.0
pkgrel=3
pkgdesc='Free japanese visual novel game, telling the story of a terminally ill young man and woman'
arch=('any')
url='http://stage-nana.sakura.ne.jp/'
license=('custom:freeware')
depends=('onscripter-en' 'sh')

source=('http://narcissu.gwathyr.net/NarcissuJP.tar.bz2'
        'narcissu.sh'
        'narcissu.desktop'
        'narcissu.png')

md5sums=('d4a98be6ed64f953c1dfd9542a681e4f'
         'f45a973e79046d428f76322c70502306'
         'a9a1c15af196c1c8fd31c3688e1672ca'
         'caeca7f043c9384c89d95c0e8455d41c')

package() {

  # icon, main files, documentation
  install -D -m644 "${pkgname}.png" "${pkgdir}/usr/share/${pkgname}/icon.png"

  cd "${srcdir}/narcissuwebban/"
  install -m644 arc.nsa default.ttf nscript.dat "${pkgdir}/usr/share/${pkgname}"
  install -D -m644 hajimeni.txt "${pkgdir}/usr/share/doc/${pkgname}"

  # desktop entry
  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # bash script
  install -D -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:

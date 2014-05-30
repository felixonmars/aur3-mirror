# Contributor: Rick W. Chen <stuffcorpse at archlinux dot us>
# Contributor: Gaute Hope <eg@gaute.vetsj.com>
# Maintainer: Stein Krauz <steinkrauz@yahoo.com>

pkgname=ttf-anonymous-pro
pkgver=1.003
pkgrel=1
pkgdesc="A family of four fixed-width fonts designed especially with coding in mind"
arch=(any)
url="http://www.marksimonson.com/fonts"
license=(custom:OFL)
groups=()
optdepends=(fontconfig xorg-fonts-encodings xorg-font-utils)
makedepends=(unzip)
install=$pkgname.install

#_fonts=("AnonymousPro" "AnonymousProMinus")
#source=("http://www.marksimonson.com/assets/content/fonts/${_fonts[0]}-$pkgver.zip"
#        "http://www.marksimonson.com/assets/content/fonts/${_fonts[1]}-$pkgver.zip")
source=("http://www.marksimonson.com/assets/content/fonts/AnonymousPro-1.002.zip"
        "http://www.marksimonson.com/assets/content/fonts/AnonymousProMinus-1.003.zip")
sha1sums=('87651de93312fdd3f27e50741d2a0630a41ec30d'
          '0502fc7da5796deb2dcc34030db88f874fe08fa9')

package() {
  mkdir -p "${pkgdir}/usr/share/fonts/TTF/"
#  for font in ${_fonts[@]} ; do
#    cd "${srcdir}/${font}-1.002.001"
    cd "${srcdir}/AnonymousPro-1.002.001"
    msg2 "Installing font AnonymousPro"
    install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
    cd "${srcdir}/AnonymousProMinus-1.003"
    msg2 "Installing font AnonymousProMinus"
    install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
# done

  install -d -m755 "$pkgdir"/usr/share/fonts/TTF \
    "$pkgdir"/usr/share/licenses/"$pkgname" \
    "${pkgdir}/usr/share/doc/${pkgname}"

  install -m644 OFL.txt OFL-FAQ.txt \
    "$pkgdir"/usr/share/licenses/"$pkgname"

  install -m644 FONTLOG.txt README.txt \
    "${pkgdir}/usr/share/doc/${pkgname}/"
}
# vim:set ts=2 sw=2 et:

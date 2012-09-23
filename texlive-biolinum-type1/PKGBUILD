# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=texlive-biolinum-type1
pkgver=5.3.0
pkgrel=1
pkgdesc="Linux biolinum fonts for TeX- and pdfTeX-users (type 1 fonts)."
url="http://mirror.ctan.org/help/Catalogue/entries/biolinum-type1.html"
arch=('any')
license=('lppl' 'GPL' 'custom:OFL')
depends=('texlive-core')
install=texlive-biolinum-type1.install
source=(http://mirror.ctan.org/install/fonts/biolinum-type1.tds.zip)
md5sums=('548c1d2dcd8b5c190e3633d6d96a220d')
replaces=('libertine-legacy-texmf')

package() {
  install -d $pkgdir/usr/share/texmf
  cp -r $srcdir/* $pkgdir/usr/share/texmf
  for _i in GPL.txt OFL-1.1.txt LICENCE.txt
  do
    install -Dm644 $pkgdir/usr/share/texmf/doc/fonts/${pkgname#texlive-}/${_i} \
      $pkgdir/usr/share/licenses/${pkgname#texlive-}/${_i}
    rm $pkgdir/usr/share/texmf/doc/fonts/${pkgname#texlive-}/${_i}
  done
}

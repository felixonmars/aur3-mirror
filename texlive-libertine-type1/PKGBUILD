# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=texlive-libertine-type1
pkgver=5.3.0
pkgrel=2
pkgdesc="Linux libertine fonts for TeX- and pdfTeX-users (type 1 fonts)."
url="http://mirror.ctan.org/help/Catalogue/entries/libertine-type1.html"
arch=('any')
license=('lppl' 'GPL' 'custom:OFL')
depends=('texlive-core')
install=texlive-libertine-type1.install
source=(http://mirror.ctan.org/install/fonts/${pkgname#texlive-}.tds.zip)
md5sums=('5ebc704e1f98ae7dceea1c9c23b73019')
replaces=('libertine-legacy-texmf')

package() {
  install -d $pkgdir/usr/share/texmf
  
  cp -r $srcdir/* $pkgdir/usr/share/texmf
  
  for _i in GPL.txt OFL-1.1.txt LICENCE.txt
  do
    install -Dm644 $pkgdir/usr/share/texmf/${pkgname#texlive-}/doc/${_i} \
      $pkgdir/usr/share/licenses/${pkgname#texlive-}/${_i}
    rm $pkgdir/usr/share/texmf/${pkgname#texlive-}/doc/${_i}
  done
}

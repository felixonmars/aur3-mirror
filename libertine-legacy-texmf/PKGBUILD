# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=libertine-legacy-texmf
pkgver=5.1.2.1
pkgrel=2
pkgdesc="The last version of the linux libertine fonts for tex and pdftex users (type 1 fonts)."
url="http://www.tex.ac.uk/tex-archive/help/Catalogue/entries/libertine-legacy.html"
arch=('any')
license=('GPL' 'OFL')
depends=('texlive-core')
install=libertine-legacy.install
source=(http://www.tex.ac.uk/tex-archive/fonts/${pkgname%-texmf}.zip)
md5sums=('eee3159bf27aca47cc7569f7c1575780')

package() {
  rm $srcdir/${pkgname%-texmf}.zip
  install -d $pkgdir/usr/share/texmf
  cp -r $srcdir/* $pkgdir/usr/share/texmf
  install -d $pkgdir/usr/share/licenses/${pkgname%-texmf}
  cd $pkgdir/usr/share/texmf/${pkgname%-texmf}/documentation
  for _i in GPL.txt OFL.txt LICENCE.txt
  do
    install -Dm644 ${_i} $pkgdir/usr/share/licenses/${pkgname%-texmf}/${_i}
    rm ${_i}
  done
}

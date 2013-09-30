# Original autor: Wolfgang Skala <Wolfgang.Skala@sbg.ac.at>
# Maintainer: Markus Kohlhase  <mail@markus-kohlhase.de>
# Last edited: 30. September 2013

pkgname=texlive-pgfgantt
pkgver=4.0
pkgrel=1
license=('LPPL')
depends=('texlive-core')
pkgdesc='A LaTeX package that provides the ganttchart environment, which draws a Gantt chart within a TikZ picture.'
url='http://www.ctan.org/pkg/pgfgantt'
arch=('any')
install=$pkgname.install
source=(http://mirrors.ctan.org/graphics/pgf/contrib/pgfgantt.zip)
md5sums=('3bdb1c22d7a134ee09132e96d1fa8bd4')

build() {
  unzip "$srcdir/pgfgantt.zip"
  cd "$srcdir/pgfgantt/"
  latex "pgfgantt.ins"
}

package() {
  mkdir -p "$pkgdir/usr/share/texmf/tex/latex/pgfgantt"
  cp "$srcdir/pgfgantt/pgfgantt.sty" "$pkgdir/usr/share/texmf/tex/latex/pgfgantt/"
}

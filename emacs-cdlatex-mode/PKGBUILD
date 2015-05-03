# Maintainer: Alad Wenter
# Contributor: Brendan Fahy <brendan@f4hy.com>
pkgname=emacs-cdlatex-mode
pkgver=4.6
pkgrel=1
pkgdesc="CDLaTeX is a minor mode supporting fast insertion of environment templates and math stuff in LaTeX."
arch=('any')
url="http://staff.science.uva.nl/~dominik/Tools/cdlatex/"
license=('GPL2')
depends=('emacs')
source=($url/cdlatex.el)
md5sums=('168e3382e78cfdaf3fd0d14dd18ef069')

package() {
  install -Dm644 "$srcdir"/cdlatex.el "$pkgdir"/usr/share/emacs/site-lisp/cdlatex.el
}

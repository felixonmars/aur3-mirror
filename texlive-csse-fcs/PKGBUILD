#Original author: Marat Akhin <akhin [at] kspt.ftk.spbstu.ru>
#Maintainer: Kirill Gagarski <gagarin.gtn [at] gmail.com>
pkgname=texlive-csse-fcs
pkgver=26
pkgrel=3
pkgdesc="LaTeX class for dissertations at http://kspt.ftk.spbstu.ru/ Deprecated. Use texlive-csse-fcs-hg instead."
arch=('any')
url="https://bitbucket.org/ice_phoenix/csse-fcs-latex/"
license=('LPPL')
makedepends=('mercurial')
depends=('texlive-core' 'texlive-langcyrillic')
provides=('texlive-csse-fcs')
conflicts=('texlive-csse-fcs-hg')
install=texlive-csse-fcs.install

_hgroot="https://bitbucket.org/ice_phoenix"
_hgrepo="csse-fcs-latex"

package() {
  mkdir -p "$pkgdir/usr/share/texmf-dist/tex/latex/csse-fcs"
  cp -r $srcdir/$_hgrepo/* "$pkgdir/usr/share/texmf-dist/tex/latex/csse-fcs/"
}
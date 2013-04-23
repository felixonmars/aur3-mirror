#Maintainer:xgdgsc < xgdgsc  at gmail dot com >

pkgname=latex-ieeeconf
pkgver=1.4
pkgrel=1
pkgdesc="Macros for IEEE con­fer­ence pro­ceed­ings"
arch=('any')
url="http://www.ctan.org/tex-archive/macros/latex/contrib/IEEEconf/"
license=('LPPL')
groups=()
depends=('texlive-bin')
makedepends=('tar' 'gzip')
optdepends=('xpdf: for viewing the manual')
backup=()
options=()
install=texlive.install
source=('http://mirrors.ctan.org/macros/latex/contrib/IEEEconf.zip')
md5sums=('ba9184469d3323fd43b42e1568d4b5f6')

package() {
  mkdir -p ${pkgdir}/usr/share/texmf/tex/latex/
  cp -vr ${srcdir}/IEEEconf  ${pkgdir}/usr/share/texmf/tex/latex/
}

# vim:set ts=2 sw=2 et:

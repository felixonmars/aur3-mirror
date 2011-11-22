# Contributor: Markus Fuchs <mail .at. mfuchs .d0t. org>

pkgname=latex-template-ieee
pkgver=1.7a
pkgrel=3
pkgdesc="the official LaTeX template for IEEE authors"
arch=('any')
url="http://www.ieee.org/web/publications/authors/transjnl/index.html"
license=('LPPL')
groups=()
depends=('texlive-bin')
makedepends=('tar' 'gzip')
optdepends=('xpdf: for viewing the manual')
backup=()
options=()
install=texlive.install
source=(http://www.ieee.org/documents/IEEEtran2.tar.gz)
md5sums=('7ba1d9df857665694fca65aab986ac1b')

build() {
  mkdir -p ${pkgdir}/usr/share/texmf/tex/latex/ieeetran/
  cd ${pkgdir}/usr/share/texmf/tex/latex/ieeetran/
  tar xzf ${srcdir}/IEEEtran2.tar.gz 
  chown -R root.root *
  cd ..
  chmod 644 ieeetran/*
}

# vim:set ts=2 sw=2 et:

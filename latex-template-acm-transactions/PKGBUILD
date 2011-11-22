#Contributor: Artemis Voulkidis <avoulk at gmail com>

pkgname=latex-template-acm-transactions
pkgver=1
pkgrel=2
pkgdesc="The official LaTeX template for ACM transactions authors."
arch=('any')
url="http://www.acm.org/publications/latex_style/"
license=('LPPL')
groups=()
depends=('texlive-bin')
makedepends=('unzip')
optdepends=('xpdf: for viewing the manual')
backup=()
options=()
install=texlive.install
source=(http://www.acm.org/publications/latex_style/acm-small-v$pkgver-$pkgrel.zip)
md5sums=('895a466e8794f1d932039abb93a5fb99')

build() {
  mkdir -p ${pkgdir}/usr/share/texmf/tex/latex/acm-small/
  mkdir -p ${pkgdir}/usr/share/texmf-dist/bibtex/bst/acm-small/
  cd ${pkgdir}/usr/share/texmf/tex/latex/acm-small/
  unzip ${srcdir}/acm-small-v$pkgver-$pkgrel.zip
  mv acmsmall.bst ${pkgdir}/usr/share/texmf-dist/bibtex/bst/acm-small/
  cd ..
  chown -R root:root *
  chmod 644 acm-small/*
  cd ${pkgdir}/usr/share/texmf-dist/bibtex/bst/
  chown -R root:root acm-small/
  chmod 644 acm-small/*
}

# vim:set ts=2 sw=2 et:  

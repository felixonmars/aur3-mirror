# Mantainer: Adria Arrufat <swiftscythe@gmail.com>

pkgname=pdfcrop
pkgver=1.38
pkgrel=1
pkgdesc="A Perl script that can crop PDF files."
arch=('any')
url="http://www.ctan.org/tex-archive/help/Catalogue/entries/pdfcrop.html"
license=('lppl')
depends=('perl' 'texlive-bin' 'ghostscript')
source=("http://mirror.ctan.org/support/pdfcrop/pdfcrop.pl")

build() {
  cd ${srcdir}/
  mv pdfcrop.pl pdfcrop
}

package() {
  cd ${srcdir}/

  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname} || return 1
}
md5sums=('568c49d1d9922205645dc7713d7bc812')

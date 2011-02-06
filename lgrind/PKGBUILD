# Contributor: Martin Pieuchot <mpieuchot () nolizard ! org>

pkgname=lgrind
pkgver=3.67
pkgrel=2
pkgdesc="A source pretty printer for LaTeX"
arch=('i686' 'x86_64')
url="http://www.ctan.org/tex-archive/help/Catalogue/entries/lgrind.html"
license=('non-free')
depends=('glibc' 'texlive-core')
source=("http://www.ctan.org/get/support/lgrind.zip")
md5sums=('467e7d1b4b697df55f851fc3bc31e978')

build() {
  cd $startdir/src/$pkgname

  sed -e "s|texmf|texmf-dist|g" -i Makefile

  sed -e "s|-s|-Ds|" -i source/Makefile
  sed -e "s|-m|-Dm|" -i source/Makefile
 
  make || return 1
  make BASEDIR=$startdir/pkg/usr install || return 1

  rm -r $startdir/pkg/usr/doc
}

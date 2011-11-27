# Contributor: Dariusz 'quasi' Panchyrz <quasi@aur.archlinux.org>

pkgname=breqn
pkgver=1.2b
pkgrel=2
pkgdesc="Automatic line breaking of displayed equations."
arch=('i686' 'x86_64')
url="http://www.ctan.org/tex-archive/help/Catalogue/entries/breqn.html"
license=('LPPL')
depends=('texlive-bin' 'texlive-core')
install=$pkgname.install
source=(ftp://cam.ctan.org/tex-archive/macros/latex/contrib/mh.zip)
md5sums=('6ae7bdc1d723dfe1cbb549a4c3b310d9')
build() {

  mkdir -p $startdir/pkg/usr/share/texmf/tex/latex/breqn
  mkdir -p $startdir/pkg/usr/share/doc/breqn

  cd $startdir/src/mh

  for i in *.dtx
  do
    tex --output-directory=$startdir/pkg/usr/share/texmf/tex/latex/breqn/ $i
  done

  for i in *.pdf
  do
    cp $i $startdir/pkg/usr/share/doc/breqn
  done

}

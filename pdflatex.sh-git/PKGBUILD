# Maintainer: Dariusz Dwornikowski <dariusz.dwornikowski@gmail.com>
pkgname=pdflatex.sh-git
pkgver=20120111
pkgrel=1
pkgdesc="pdfLaTeX build script"
arch=("any")
url="https://github.com/mkalewski/pdflatex.sh"
license=('GPL')
groups=('pdflatex.sh')
depends=('texlive-bin' 'texlive-core')
makedepends=('git')
checkdepends=()
optdepends=('dia: required to perform conversion from dia files'
            'inkscape: required to convert svg to pdf'
            'aspell: spell checking'
            'texlive-latexextra: for ps2pdf convertion'
            )
provides=('pdflatex.sh')
conflicts=('pdflatex.sh')
backup=()
options=()
install=pdflatex.sh.install
changelog=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot="git://github.com/mkalewski/pdflatex.sh.git"
_gitname="pdflatex.sh-git"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated"
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"

}


package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$srcdir/$_gitname/pdflatex.sh" "$pkgdir/usr/bin/pdflatex.sh"
}

# vim:set ts=2 sw=2 et:

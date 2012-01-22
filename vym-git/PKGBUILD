# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=vym-git
pkgver=20120122
pkgrel=1
pkgdesc="A mindmapping tool - developement version from git"
arch=('i686' 'x86_64')
url="http://www.insilmaril.de/vym"
license=('GPL')
groups=()
depends=('qt' 'unzip' 'zip')
makedepends=('git' 'texlive-core')
provides=('vym')
conflicts=('vym')
options=('!emptydirs')
source=('vym-git.desktop')
md5sums=('ef7cfe93f97803159da7c9a136d58b47')
install=vym.install

_gitroot="git://vym.git.sourceforge.net/vym/vym"
_gitname="vym"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  [ -d "$srcdir/$_gitname-build" ] && rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  qmake PREFIX=/usr DOCDIR=/usr/share/doc/$pkgname
  make
  cd tex

  for _i in *.tex
  do 
    pdflatex $_i && pdflatex $_i && pdflatex $_i
  done  
}

package() {
  cd "$srcdir/$_gitname-build"
  make INSTALL_ROOT=${pkgdir} install
  
#  install -Dm644 doc/vym.1 ${pkgdir}/usr/share/man/man1/vym.1
  cd tex
  for _i in *.pdf
  do 
    install -Dm644 $_i ${pkgdir}/usr/share/doc/$pkgname/$_i
  done  
  
# .desktop and icon file
  install -D -m644 ${srcdir}/$pkgname.desktop \
    ${pkgdir}/usr/share/applications/$pkgname.desktop
  install -D -m644 ${pkgdir}/usr/share/vym/icons/vym.png \
    ${pkgdir}/usr/share/pixmaps/$pkgname.png
}

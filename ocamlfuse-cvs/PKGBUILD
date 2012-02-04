# Contributor: Predrag Radovic <predrg@gmail.com>

pkgname=ocamlfuse-cvs
pkgver=20111016
pkgrel=1
pkgdesc="OCaml binding for fuse enabling you to write your own multithreaded, efficient userspace filesystems"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/ocamlfuse/"
license=('GPL')
depends=('fuse>=2.7' 'ocaml>=3.08' 'camlidl>=1.05')
makedepends=('cvs')
source=()
md5sums=()

_DEBUG=

_cvsroot=":pserver:anonymous@ocamlfuse.cvs.sourceforge.net:/cvsroot/ocamlfuse"
_cvsmod="ocamlfuse"

build() {
  cd "$srcdir"
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
    cd $_cvsmod
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  if [ "$_DEBUG" = "" ]; then
    cd "$srcdir/$_cvsmod/lib"
    make
  else
    cd "$srcdir/$_cvsmod/lib"
    sed -i 's/OCAMLLDFLAGS=-linkall/OCAMLLDFLAGS=-linkall -g/g' Makefile
    make OCAMLFLAGS=-g
  fi
}

package() {
  if [ "$_DEBUG" = "" ]; then
    cd "$srcdir/$_cvsmod/lib"
    make OCAMLLIBPATH="${pkgdir}$(ocamlc -where)" install
  else
    cd "$srcdir/$_cvsmod/lib"
    make OCAMLLIBPATH="${pkgdir}$(ocamlc -where)" OCAMLFLAGS=-g install
  fi

  cd "$srcdir/$_cvsmod"
  for f in README OCamlMakefile example/*.ml example/Makefile*; do
    install -D -m644 $f ${pkgdir}/usr/share/${pkgname}/$f
  done
}


# Maintainer:  mrshpot <mrshpot at gmail dot com>

pkgname=cl-squirl-git
_clname=squirl   # used in CL scope, not package scope
pkgver=20110219
pkgrel=1
pkgdesc="Common Lisp port of the Chipmunk 2D physics library"
arch=('i686' 'x86_64')
url="https://github.com/sykopomp/squirl"
license=('custom')
provides=('cl-squirl')

depends=('common-lisp' 'cl-asdf')
optdepends=('cl-opengl: for running demos'
  'cl-lispbuilder-sdl: for running demos')

makedepends=('git') 

install=cl-squirl.install
source=()
md5sums=()

_gitroot="git://github.com/sykopomp/squirl.git"
_gitname="squirl"


build() {

  cat << EOM

	WARNING!

	You are about to build a package using a snapshot from a repository.
        The resulting package may be unusable or pose a security risk, since
        the install script does not check source file hashes. Do not continue
        if this is undesirable.

EOM

  install -d ${pkgdir}/usr/share/common-lisp/systems
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  for _dir in src src/constraints demo; do
    install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}/${_dir}
  done

	### Git checkout
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi
  cd "$srcdir/$_gitname"
  
  msg "GIT checkout done or server timeout"


  install -m 644 -t ${pkgdir}/usr/share/licenses/${pkgname} COPYING
  for _dir in src src/constraints demo; do
    install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname}/${_dir}/ \
      ${_dir}/*.lisp
  done
  msg "done installing source"
  install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
    ${_clname}.asd
  msg "done installing asd"

  cd ${pkgdir}/usr/share/common-lisp/systems
  ln -s ../source/${_clname}/${_clname}.asd .
}

# Maintainer:  mrshpot <mrshpot at gmail dot com>
# Contributor:  veox <box 55 [shift-two] mail [dot] ru>

pkgname=cl-trivial-backtrace-git
_clname=trivial-backtrace   # used in CL scope, not package scope
pkgver=20101120
pkgrel=1
pkgdesc="A library to display backtraces portably across Common Lisp implementations"
arch=('i686' 'x86_64')
url="http://common-lisp.net/project/trivial-backtrace/"
license=('LGPL')
provides=('cl-trivial-backtrace')

# TODO: replace this segment with 'common-lisp' when all provide it.
if pacman -Qq clisp-new-clx &>/dev/null; then
    depends=('clisp-new-clx' 'cl-asdf')
elif pacman -Qq clisp-gtk2 &>/dev/null; then
    depends=('clisp-gtk2' 'cl-asdf')
elif pacman -Qq sbcl &>/dev/null; then
    depends=('sbcl')
elif pacman -Qq clisp &>/dev/null; then
    depends=('clisp' 'cl-asdf')
elif pacman -Qq cmucl &>/dev/null; then
    depends=('cmucl' 'cl-asdf')
else
    depends=('sbcl')
fi
makedepends=('git') 

install=cl-trivial-backtrace.install
source=()
md5sums=()
options=('docs')

_gitroot="http://common-lisp.net/project/trivial-backtrace/trivial-backtrace.git"
_gitname="cl-trivial-backtrace"


build() {

  cat << EOM

	WARNING!

	You are about to build a package using a snapshot from a repository.
        The resulting package may be unusable or pose a security risk, since
        the install script does not check source file hashes. Do not continue
        if this is undesirable.

EOM

  install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}
  install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}/dev
  install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}/test
  install -d ${pkgdir}/usr/share/common-lisp/systems
  install -d ${pkgdir}/usr/share/licenses/${pkgname}

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

  install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname}/dev \
    dev/*
  install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname}/test \
    test/*
  install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
    *.asd

  cd ${pkgdir}/usr/share/common-lisp/systems
  ln -s ../source/${_clname}/${_clname}.asd .
}

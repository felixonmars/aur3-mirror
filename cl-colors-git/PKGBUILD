# Maintainer:  mrshpot <mrshpot at gmail dot com>
# Contributor:  veox <box 55 [shift-two] mail [dot] ru>

pkgname=cl-colors-git
_clname=cl-colors   # used in CL scope, not package scope
pkgver=20101211
pkgrel=2
pkgdesc="Simple color library for Common Lisp"
arch=('i686' 'x86_64')
url="http://common-lisp.net/project/cl-colors/"
license=('LGPL')
provides=('cl-colors')

# TODO: replace this segment with 'common-lisp' when all provide it.
if pacman -Qq clisp-new-clx &>/dev/null; then
    depends=('clisp-new-clx' 'cl-asdf' 'cl-utilities')
elif pacman -Qq clisp-gtk2 &>/dev/null; then
    depends=('clisp-gtk2' 'cl-asdf' 'cl-utilities')
elif pacman -Qq sbcl &>/dev/null; then
    depends=('sbcl' 'cl-utilities')
elif pacman -Qq clisp &>/dev/null; then
    depends=('clisp' 'cl-asdf' 'cl-utilities')
elif pacman -Qq cmucl &>/dev/null; then
    depends=('cmucl' 'cl-asdf' 'cl-utilities')
else
    depends=('sbcl' 'cl-utilities')
fi
makedepends=('git') 

install=cl-colors.install
source=()
md5sums=()
options=('docs')

_gitroot="git://github.com/tpapp/cl-colors.git"
_gitname="cl-colors"


build() {

  cat << EOM

	WARNING!

	You are about to build a package using a snapshot from a repository.
        The resulting package may be unusable or pose a security risk, since
        the install script does not check source file hashes. Do not continue
        if this is undesirable.

EOM

  install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}
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

  install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
    *.lisp
  install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
    *.asd

  cd ${pkgdir}/usr/share/common-lisp/systems
  ln -s ../source/${_clname}/${_clname}.asd .
}

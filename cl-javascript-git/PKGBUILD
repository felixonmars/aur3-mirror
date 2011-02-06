# Maintainer:  mrshpot <mrshpot at gmail dot com>

pkgname=cl-javascript-git
_clname=cl-js   # used in CL scope, not package scope
pkgver=20101213
pkgrel=1
pkgdesc="CL-JavaScript allows you to add user scripting to your Common Lisp application"
arch=('i686' 'x86_64')
url="http://marijnhaverbeke.nl/cl-javascript/"
license=('custom')
provides=('cl-js' 'cl-javascript')

# TODO: replace this segment with 'common-lisp' when all provide it.
if pacman -Qq clisp-new-clx &>/dev/null; then
    depends=('clisp-new-clx' 'cl-asdf' 'cl-parse-js' 'cl-ppcre')
elif pacman -Qq clisp-gtk2 &>/dev/null; then
    depends=('clisp-gtk2' 'cl-asdf' 'cl-parse-js' 'cl-ppcre')
elif pacman -Qq sbcl &>/dev/null; then
    depends=('sbcl' 'cl-parse-js' 'cl-ppcre')
elif pacman -Qq clisp &>/dev/null; then
    depends=('clisp' 'cl-asdf' 'cl-parse-js' 'cl-ppcre')
elif pacman -Qq cmucl &>/dev/null; then
    depends=('cmucl' 'cl-asdf' 'cl-parse-js' 'cl-ppcre')
else
    depends=('sbcl' 'cl-parse-js' 'cl-ppcre')
fi
optdepends=('cl-local-time: for the Date implementation')
makedepends=('git') 

install=cl-javascript.install
source=()
md5sums=()
options=('docs')

_gitroot="https://github.com/akapav/js.git"
_gitname="cl-js"


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
  install -d ${pkgdir}/usr/share/doc/${pkgname}
  
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

  install -m 644 -t ${pkgdir}/usr/share/licenses/${pkgname} LICENSE
  install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
    *.lisp
  install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
    *.asd
  install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
    *.js
  install -m 644 -t ${pkgdir}/usr/share/doc/${pkgname} index.html
  install -m 644 -t ${pkgdir}/usr/share/doc/${pkgname} README.md

  cd ${pkgdir}/usr/share/common-lisp/systems
  ln -s ../source/${_clname}/${_clname}.asd .
}

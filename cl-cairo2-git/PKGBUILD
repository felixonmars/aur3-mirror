# Maintainer:  mrshpot <mrshpot at gmail dot com>
# Contributor:  veox <box 55 [shift-two] mail [dot] ru>

pkgname=cl-cairo2-git
_clname=cl-cairo2   # used in CL scope, not package scope
pkgver=20101211
pkgrel=1
pkgdesc="A graphics library that provides Common Lisp bindings for the Cairo API."
arch=('i686' 'x86_64')
url="http://cliki.net/cl-cairo2"
license=('custom')   # Public Domain
provides=('cl-cairo2')

# TODO: replace this segment with 'common-lisp' when all provide it.
if pacman -Qq clisp-new-clx &>/dev/null; then
  depends=('clisp-new-clx' 'cl-asdf'
	'cl-metabang-bind' 'cl-colors' 'cl-trivial-garbage' 'cl-trivial-features' 'cl-cffi')
elif pacman -Qq clisp-gtk2 &>/dev/null; then
  depends=('clisp-gtk2' 'cl-asdf'
	'cl-metabang-bind' 'cl-colors' 'cl-trivial-garbage' 'cl-trivial-features' 'cl-cffi')
elif pacman -Qq sbcl &>/dev/null; then
  depends=('sbcl'
	'cl-metabang-bind' 'cl-colors' 'cl-trivial-garbage' 'cl-trivial-features' 'cl-cffi')
elif pacman -Qq clisp &>/dev/null; then
  depends=('clisp' 'cl-asdf'
	'cl-metabang-bind' 'cl-colors' 'cl-trivial-garbage' 'cl-trivial-features' 'cl-cffi')
elif pacman -Qq cmucl &>/dev/null; then
  depends=('cmucl' 'cl-asdf'
	'cl-metabang-bind' 'cl-colors' 'cl-trivial-garbage' 'cl-trivial-features' 'cl-cffi')
else
  depends=('sbcl'
	'cl-metabang-bind' 'cl-colors' 'cl-trivial-garbage' 'cl-trivial-features' 'cl-cffi')
fi

makedepends=('git') 

install=cl-cairo2.install
source=()
md5sums=()
options=('docs')

_gitroot="git://github.com/tpapp/cl-cairo2.git"
_gitname="cl-cairo2"


build() {

  cat << EOM

	WARNING!

	You are about to build a package using a snapshot from a repository.
        The resulting package may be unusable or pose a security risk, since
        the install script does not check source file hashes. Do not continue
        if this is undesirable.

EOM

  for _dir in src tutorial; do
    install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}/${_dir}
  done
  for _dir in gtk2 quartz win32 xlib; do
    install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}/src/${_dir}
  done
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


  for _dir in gtk2 quartz win32 xlib; do
    install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname}/src/${_dir} \
      ./src/${_dir}/*
  done
  msg "done installing etc"
  for _dir in src tutorial; do
    install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname}/${_dir}/ \
      ${_dir}/*.lisp
  done
  msg "done installing source"
  install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
    *.asd
  msg "done installing asd"

  cd ${pkgdir}/usr/share/common-lisp/systems
  ln -s ../source/${_clname}/${_clname}.asd .
}

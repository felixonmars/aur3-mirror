# Maintainer: Reza Jelveh http://reza.jelveh.me

pkgname=grfkill
pkgver=20120107
pkgrel=1
pkgdesc='minimalistic rfkill gtk+ gui'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/fishman/grfkill'
depends=("gtk3")
_gitroot="git://github.com/fishman/grfkill.git"
_gitname="grfkill"

# PKGBUILD functions
build() {
  cd "$srcdir"
  msg2 "Connecting to github.com GIT server...."
  if [ -d "$srcdir/$_gitname" ] ; then
    cd "$_gitname" && git pull origin || return 1
    msg2 "The local files are updated."
  else
    git clone "$_gitroot" || return 1
    cd "$_gitname"
  fi

  make
}

package() {
  cd "${srcdir}/${_gitname}"
  install -D -m755 ${srcdir}/${_gitname}/grfkill $pkgdir/usr/bin/grfkill || return 1

}

# vim:set ts=2 sw=2 et:

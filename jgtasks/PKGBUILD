# Maintainer: Chuan Ji <jichuan89@gmail.com>

pkgname=jgtasks
pkgver=20120413
pkgrel=2
pkgdesc="A simple ncurses-based text mode Google Tasks client in Python"
arch=('i686' 'x86_64')
url="http://gitorious.org/jgtasks/"
license=('Apache')
depends=('python2-google-api-python-client')
makedepends=('git')
provides=('jgtasks')
conflicts=('jgtasks')

_gitroot="git://gitorious.org/jgtasks/jgtasks.git"
_gitname="jgtasks"

build(){
  cd "${srcdir}"
  msg "Connecting to GIT server...."
  
  if [[ -d ${_gitname} ]]; then
    cd "${_gitname}"
    git pull origin
    msg "The local files are updated."
  else
    git clone "${_gitroot}"
    cd "${_gitname}"
  fi
}

package(){
  install -Dm755 "${srcdir}/${_gitname}/${_gitname}.py" "${pkgdir}/usr/bin/${_gitname}"
  install -Dm644 "${srcdir}/${_gitname}/README" "${pkgdir}/usr/share/doc/${_gitname}/README"
}

# vim:set ts=2 sw=2 et:

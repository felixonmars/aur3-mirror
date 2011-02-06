# Maintainer: Philipp Überbacher <murks at lavabit dot com>
pkgname=lv2fil-git
pkgver=20101218
pkgrel=1
pkgdesc="Four-band parametric equalisers with visualisation."
arch=('i686' 'x86_64')
url="http://nedko.arnaudov.name/soft/lv2fil/"
license=('GPL')
depends=('pygtk' 'pycairo')
makedepends=('lv2core')
conflicts=('lv2fil')
provides=('lv2fil')
md5sums=()

_gitroot="http://nedko.arnaudov.name/git/lv2fil.git"
_gitname="lv2fil"

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/${_gitname}-build"
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"

  python2 ./waf configure --lv2-dir=/usr/lib/lv2
  python2 ./waf
}

package(){
  cd "${srcdir}/${_gitname}-build"

  python2 ./waf install --destdir="${pkgdir}"
}

# vim:set ts=2 sw=2 et:

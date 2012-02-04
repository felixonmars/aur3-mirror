# Maintainer: Alessio Sergi <asergi at archlinux dot us>

pkgname=gloobus-sushi-bzr
_realname=gloobus-sushi
pkgver=2
pkgrel=1
pkgdesc="GloobusPreview replacement for Gnome Sushi"
arch=('i686' 'x86_64')
url="https://launchpad.net/gloobus-sushi"
license=('GPL3')
depends=('pygtk' 'dbus-python' 'gloobus-preview')
makedepends=('bzr' 'intltool')

provides=(${_realname})
conflicts=(${_realname} 'sushi')
options=('!libtool')

_bzrtrunk="lp:${_realname}"
_bzrmod="${_realname}"

build() {
  cd "${srcdir}"

  msg "Connecting to the server...."

  if [ -d ${_bzrmod} ]; then
    bzr up ${_bzrmod}
    msg "The local files are updated."
  else
    bzr co ${_bzrtrunk} ${_bzrmod}
  fi

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${_bzrmod}-build"
  cp -r "${_bzrmod}" "${_bzrmod}-build"
  cd "${_bzrmod}-build"

  # python2 fix
  for file in $(find . -name Makefile -print) src/gloobus-sushi.in ; do
      sed -i 's_python _python2 _' $file
  done

  export PYTHON=python2
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_bzrmod}-build"

  make DESTDIR="${pkgdir}" install
}


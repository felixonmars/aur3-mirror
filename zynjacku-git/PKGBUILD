# Maintainer:  Bernardo Barros <bernardobarros at gmail dot com>
# Contributor: Philipp Überbacher <murks at lavabit dot com>
# Contributor: Nate Slottow (m00tp01nt) <nslottow AT gmail DOT com>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=zynjacku-git
_realname=zynjacku
pkgver=20101220
pkgrel=1
pkgdesc="JACK based host for LV2 synths and effects, also containing lv2rack. Development version."
arch=('i686' 'x86_64')
url="http://home.gna.org/zynjacku/"
license=('GPL')
depends=('jack' 'python2' 'lash' 'gtk2' 'lv2dynparam1>=2')
makedepends=('lv2core')
options=('!libtool')

source=()
md5sums=()

_gitroot="git://repo.or.cz/zynjacku.git"
_gitname="zynjacku"

build() {
  cd $srcdir
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    (cd $_gitname && git pull origin)
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  cd $_realname

  ./bootstrap

  # Python2 fixes
  export PYTHON="python2"
  sed -i "s_env python_&2_" `grep -rlE "env python" .`

  ./configure --prefix="/usr"
  make
}

package() {
  cd $srcdir
  cd $_realname
  make DESTDIR="${pkgdir}" install
}

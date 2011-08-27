# Maintainer: veox <veox at wre dot ath dot cx>
# Contributor: Philipp Überbacher <hollunder at gmx dot at>

pkgname=lash-git
pkgver=20110124
pkgrel=1
pkgdesc="A session management system for Linux audio applications"
arch=('i686' 'x86_64')
options=('!libtool')
url="http://www.nongnu.org/lash/"
license=('GPL')
optdepends=('gtk2: for GTK+ clients' 'texinfo: for info documentation')
depends=('jack-audio-connection-kit>=0.109.2' 'dbus-core' 'python2')
makedepends=('swig')
provides=('lash=0.6.0')
source=()
md5sums=()

_gitroot="git://git.sv.gnu.org/lash.git"
#_gitroot="git://repo.or.cz/lash.git"
_gitname="lash"

build() {
  cd ${srcdir}
  if [ -d ${srcdir}/${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    msg "Cloning git repo."
    git clone ${_gitroot}
    msg "Git repo cloned, maybe..."
  fi

  msg "GIT checkout done or server timeout."
  msg "Starting make..."

  cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build" || return 1
  cd "${srcdir}/${_gitname}-build"
  
  ./autogen.sh || return 1
  ./configure --prefix="/usr" PYTHON=`which python2` || return 1
  #./configure --prefix="/usr" --without-jack-dbus || return 1
  make || return 1
}

package() {
  cd "${srcdir}/${_gitname}-build"
  make DESTDIR="${pkgdir}" install || return 1
  
  mkdir -p ${pkgdir}/usr/share/info
  gzip -9 -c docs/lash-manual.info > ${pkgdir}/usr/share/info/lash.info.gz || return 1
}

# Contributor: Federico Chiacchiaretta <federico.chia at gmail.com>
pkgname=kmess-git
pkgver=20110203
pkgrel=1
pkgdesc="A full-featured MSN Client for KDE - GIT development version"
arch=('i686' 'x86_64')
url="http://www.kmess.org/"
license=('GPL')
depends=('kdebase-runtime' 'libxss' 'libxslt')
makedepends=('git' 'kdebase-lib' 'cmake' 'automoc4' 'docbook-xsl')
optdepends=('cabextract: Winks support'
            'flashplugin: Winks support'
	    'kdebase-lib: Send files from dolphin using kmess')
conflicts=('kmess' 'kmess2.0.x-git' 'kmess-svn' 'kmess-svn-stable' 'libisf-qt-git' 'libmimic-qt-git')
install=$pkgname.install

_gitroot="git://gitorious.org/kmess/kmess.git"
_gitname="kmess-git"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  cd ${srcdir}/${_gitname}
  git submodule update --init contrib/isf-qt

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${srcdir}/build
  mkdir ${srcdir}/build
  cd ${srcdir}/build

  #
  # BUILD HERE
  #

  cmake ../$_gitname \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make || return 1
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install || return 1
} 

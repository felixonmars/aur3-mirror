# Contributor: Federico Chiacchiaretta <federico.chia at gmail.com>
pkgname=kmess-stable-git
pkgver=20110203
pkgrel=1
pkgdesc="A full-featured MSN Client for KDE - GIT stable branch version"
arch=('i686' 'x86_64')
url="http://www.kmess.org/"
license=('GPL')
depends=('kdebase-runtime' 'libxss' 'libxslt')
makedepends=('git' 'kdebase-lib' 'cmake' 'automoc4' 'docbook-xsl')
optdepends=('cabextract: Winks support'
            'flashplugin: Winks support'
	    'kdebase-lib: Send files from dolphin using kmess')
conflicts=('kmess' 'kmess-git' 'kmess-svn' 'kmess-svn-stable' 'libisf-qt-git')
install=$pkgname.install

_gitroot="git://gitorious.org/kmess/kmess.git"
_gitbranch=kmess-2.0.x
_gitname=kmess-git

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $srcdir/$_gitname ] ; then
    cd $srcdir/$_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"

  rm -rf ${srcdir}/$_gitbranch
  cp -r ${srcdir}/$_gitname ${srcdir}/$_gitbranch

  msg "Selecting a branch: $_gitbranch"
  cd $srcdir/$_gitbranch
  git checkout -b $_gitbranch origin/$_gitbranch
  git submodule update --init contrib/isf-qt

  msg "Starting make..."

  rm -rf ${srcdir}/build
  mkdir ${srcdir}/build
  cd ${srcdir}/build

  #
  # BUILD HERE
  #

  cmake ../$_gitbranch \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make || return 1
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install || return 1
} 

# Maintainer: Jukka Peranto (jukkaperanto (a) gmail.com
# Contributor: Rumpa

pkgname=kdeplasma-applets-pingz
_realname=pingz
pkgver=20121205
pkgrel=1
pkgdesc="Super simple network connection internet availability monitor plasmoid thing"
arch=('i686' 'x86_64')
url="http://quickgit.kde.org/?p=scratch%2Fmklapetek%2Fpingz.git"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4' 'git' 'docbook-xsl')
#provides=("")
#conflicts=("")
md5sums=()

_gitroot="git://anongit.kde.org/scratch/mklapetek/${_realname}"
_gitname=${_realname}

build() {
  cd ${srcdir}

  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ]; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${srcdir}/build
  git clone ${srcdir}/${_gitname} ${srcdir}/build
  cd ${srcdir}/build

  cmake . -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}

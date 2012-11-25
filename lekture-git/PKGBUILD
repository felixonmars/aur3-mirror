#Mantaince: Adria Arrufat <swiftscythe @ gmail.com>

pkgname=lekture-git
pkgver=20121119
pkgrel=1
pkgdesc="An application intended to ease the making of educational, screencast-based videos like the ones you can find on khan academy"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/lekture?content=155292"
license="GPL"
depends=('kdelibs')
makedeps=('cmake' 'automoc4' 'git')
source=()
md5sums=()

_gitroot="git://anongit.kde.org/scratch/omas/lekture.git"
_gitname=${pkgname}

build() {
  
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${_gitname}/.git ] ; then
    cd ${_gitname}

    # Change remote url to anongit
    if [ -z $( git branch -v | grep anongit ) ] ; then
        git remote set-url origin ${_gitroot}
    fi
    
    git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  #rm -rf ${srcdir}/build
  mkdir -p ${srcdir}/lekture-git/build
  cd ${srcdir}/lekture-git/build || return 1

  #mkdir build
  #cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../
  make
}

package(){
  cd ${srcdir}/lekture-git/build
  make DESTDIR=${pkgdir} install
}

# Packager:  csgeek at linux dot us
## Based on amarok-git but points to amarok-ase repo with gpodder support 
## under development.

pkgname=amarok-ase-git
conflicts=('amarok' 'amarok2')
replaces=('amarok-svn' 'amarok2-svn')
pkgver=20110301
pkgrel=1
pkgdesc="A media player for KDE with under development gPodder support (very alpha) - GIT version"
arch=("i686" "x86_64")
url="http://amarok.kde.org"
license=('GPL2' 'LGPL2' 'FDL')
depends=('kdebase-runtime' 'mysql' 'qtscriptgenerator' 'taglib-extras'
        'liblastfm' 'ffmpeg' 'libofa'   'libmygpo-qt-git' )
makedepends=('pkgconfig' 'automoc4' 'cmake' 'libgpod' 'libmtp' 'loudmouth'
        'docbook-xsl' 'git')
optdepends=("libgpod: support for Apple iPod audio devices"
	"libmtp: support for portable media devices"
	"loudmouth: backend needed by mp3tunes for syncing"
    "ifuse: support for Apple iPod Touch and iPhone")
install="${pkgname}.install"

_gitroot="https://github.com/ase23/amarok-ase.git"
_gitname="amarok"

source=()
md5sums=()

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

  cd ${srcdir}/${_gitname}
  git checkout gpodder

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${srcdir}/build
  mkdir -p ${srcdir}/build
  cd ${srcdir}/build 

  cmake ../${_gitname} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package(){
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install

  ## One of libraries for strigi casuses problems with m4v files
  #rm -rf ${pkgdir}/usr/lib/strigi
}

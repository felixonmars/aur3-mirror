# Maintainer: Daniel Wallace daniel.wallace@gatech.edu

pkgname=minitunes-git
_pkgname=minitunes
pkgver=20120609
pkgrel=1
pkgdesc="Just another music player, only better"
arch=('i686' 'x86_64')
url="http://gitorious.org/minitunes"
license=('GPL3')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'phonon')
makedepends=('git' 'qt' 'taglib' )
optdepends=('gstreamer0.10-plugins: for gstreamer backend'
            'phonon-gstreamer: gstreamer backend'
            'phonon-mplayer-git: mplayer backend'
            'phonon-vlc: vlc backend'
            'phonon-xine: xine backend')
provides=(musique)
conflicts=(musique minitunes)
replaces=(musique)
install=$pkgname.install
source=($pkgname.install
        unistd.patch)

_gitroot="git://gitorious.org/$_pkgname/$_pkgname.git"
_gitname=$_pkgname

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  patch -Np1 -i "$srcdir/${source[1]}"
  qmake PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make INSTALL_ROOT="$pkgdir" install
 }
md5sums=('e13d2704d3c07185dfca8d62ffb15758'
         '01aa595e062f7968f0ae6b215487f9f8')

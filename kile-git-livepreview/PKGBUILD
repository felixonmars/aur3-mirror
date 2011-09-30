pkgname=kile-git-livepreview
pkgver=20110930
pkgrel=1
pkgdesc="A TeX/LaTeX frontend for KDE (with experimental live previewer from livepreview git branch)"
arch=('i686' 'x86_64')
url="http://sourceforge.net/apps/mediawiki/kile/index.php?title=Live_Preview"
license=('GPL2')
depends=('kdelibs' 'texlive-core' 'hicolor-icon-theme' 'shared-mime-info' 'xdg-utils' 'gcc-libs')
makedepends=('cmake' 'automoc4' 'git' 'docbook-xml' 'okular-git-viewerinterface')
install=kile-git.install
conflicts=('kile')
provides=('kile')
replaces=('kile-svn')

_gitroot="git://anongit.kde.org/kile -b livepreview"
_gitname=kile

build() {
  cd "$srcdir"

  msg "Connecting to GIT server...."

  if [ -d "$srcdir/$_gitname" ] ; then
    cd $_gitname
    git config remote.origin.url $_gitroot
    git pull origin
    msg "The local files are updated."
    cd ../
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf build
  mkdir build
  cd build

  cmake ../$_gitname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install
}

# Maintainer: Rick W. Chen <stuffcorpse@archlinux.us>
pkgname=tellico-git
pkgver=20110423
pkgrel=1
pkgdesc="A collection manager for KDE 4.x"
arch=('i686' 'x86_64')
url="http://tellico-project.org/"
license=("GPL2")
depends=('exempi' 'kdebase-runtime' 'kdegraphics-libs' 'kdemultimedia-kioslave'
         'kdepimlibs' 'poppler-qt' 'qimageblitz' 'qjson' 'yaz')
makedepends=("git" "cmake" "automoc4")
provides=('tellico')
install=${pkgname}.install

_gitroot="git://anongit.kde.org/tellico"
_gitname="tellico"

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
  git clone -l "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

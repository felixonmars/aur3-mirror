# COPYRIGHT 2012 SANDSMARK <3

pkgname=bakaar-git
pkgver=20120525
pkgrel=1
pkgdesc="Video player for KDE"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php?content=126346"
license=('GPL')
depends=('automoc4' 'kdelibs' 'phonon')
makedepends=('git' 'cmake')
source=()
md5sums=()

_gitroot="git://anongit.kde.org/scratch/sandsmark/bakaar"
_gitname="bakaar"

build() {
  cd $startdir/src

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

  cd $srcdir/$_gitname-build
  cmake . -DCMAKE_INSTALL_PREFIX=$( kde4-config --prefix ) || return 1
  make || return 1
  make DESTDIR="$pkgdir" install
}

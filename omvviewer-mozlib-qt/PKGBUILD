# Contributor: Medical-Wei/Lanny Bikcin <medicalwei at gmail dot com>

pkgname=omvviewer-mozlib-qt
pkgver=20090306
pkgrel=1
pkgdesc="Browser library for omvviewer."
arch=('i686' 'x86_64')
url="http://omvviewer.byteme.org.uk/index.shtml"
license=('GPL')
depends=('qt' 'libwebkit')
makedepends=('git')


_gitroot="git://git.byteme.org.uk/home/git/mozlibqt.git"
_gitname="mozlibqt"

build() {
  cd $srcdir

  msg "Connecting to GIT server..."
  if [[ -d $_gitname ]]; then
    (cd $_gitname && git pull origin)
  else
    git clone $_gitroot $_gitname
    (cd $_gitname/llmozlib2 && git checkout -b linux origin/robin)
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf $_gitname-build
  cp -r $_gitname $_gitname-build
  cd $_gitname-build/llmozlib2

  qmake || return 1
  make || return 1

  mkdir -p $pkgdir/usr/lib/ 
  mkdir -p $pkgdir/usr/include/ 
  install -m755 libllmozlib2.so.1.0.0 \
      $pkgdir/usr/lib/libllmozlib2.so.1.0.0
  ln -s libllmozlib2.so.1.0.0 $pkgdir/usr/lib/libllmozlib2.so
  ln -s libllmozlib2.so.1.0.0 $pkgdir/usr/lib/libllmozlib2.so.1
  ln -s libllmozlib2.so.1.0.0 $pkgdir/usr/lib/libllmozlib2.so.1.0
  install -m755 llmozlib2.h \
      $pkgdir/usr/include/llmozlib2.h
}

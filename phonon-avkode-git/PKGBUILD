# Contributor: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=phonon-avkode-git
pkgver=20120704
pkgrel=1
pkgdesc="Phonon AVKode backend, git version"
arch=('i686' 'x86_64')
url="http://quickgit.kde.org/index.php?p=scratch%2Fsandsmark%2Favkode.git&a=summary"
license=('LGPL')
depends=('phonon' 'ffmpeg' 'alsa-lib')
makedepends=('git' 'automoc4' 'cmake' 'phonon')
provides=('phonon-avkode' 'phonon-backend')
conflicts=('phonon-avkode')

_gitroot="git://anongit.kde.org/scratch/sandsmark/avkode"
_gitname="phonon-avkode"

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

  cmake -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) \
        -DCMAKE_BUILD_TYPE=RelDebug \
        ../${_gitname}
  make
  make DESTDIR=$pkgdir install
  rm -rf "$srcdir/$_gitname-build"
} 

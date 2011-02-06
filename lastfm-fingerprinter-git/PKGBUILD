# Maintainer: Liu Chang <goduck777@gmail.com>
 
pkgname=lastfm-fingerprinter-git
pkgver=20100919
pkgrel=1
pkgdesc='Official Last.fm fingerprint library and an example client.'
arch=('i686' 'x86_64')
license=('LGPL')
depends=('fftw' 'libmad' 'taglib' 'curl' 'libsamplerate')
makedepends=('cmake')
url='http://github.com/lastfm/Fingerprinter'
conflicts=()
provides=(lastfm-fingerprinter)
source=()
md5sums=()

_gitroot="git://github.com/lastfm/Fingerprinter.git"
_gitname="Fingerprinter"

build() {
  cd $srcdir
  msg "Connecting to the GIT server...."
  
  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi
  
  msg "GIT checkout done"
  msg "Starting make..."

  git clone $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build
  
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .

  make
  make DESTDIR="${pkgdir}" install

  rm -rf $srcdir/$_gitname-build
}

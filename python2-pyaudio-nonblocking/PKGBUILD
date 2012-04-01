# Maintainer: Josh Klar <iv5970@gmail.com>
pkgname=python2-pyaudio-nonblocking
pkgver=20120401
pkgrel=1
pkgdesc="PortAudio bindings for Python (patched with non-blocking mode)"
arch=('any')
url="https://github.com/bastibe/PyAudio"
license=('MIT')
depends=('python2' 'portaudio')
makedepends=('git')
provides=('python2-pyaudio')
conflicts=('python2-pyaudio')
replaces=('python2-pyaudio')
options=()

_gitroot="https://github.com/bastibe/PyAudio.git"
_gitname="PyAudio"

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

  python2 ./setup.py install --root="$pkgdir"/ || return 1
}


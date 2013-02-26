# Maintainer: Karsten Runge <karsten@egnur.de>
pkgname=wiringpi-python-git
pkgver=20130226
pkgrel=1
pkgdesc="Lib with Python2 binding for RaspberryPi."
url="https://github.com/WiringPi/WiringPi-Python"
arch=('x86_64' 'i686' 'armv6h')
license=('GPLv3')
depends=('python2' 'python2-distribute')
makedepends=()
optdepends=()
conflicts=('wiringpi-python')
provides=('wiringpi-python')

_gitroot=https://github.com/WiringPi/WiringPi-Python.git
_gitname=WiringPi-Python

_gitroot2=https://github.com/WiringPi/WiringPi.git
_gitname2=WiringPi

build() {
cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
    cd ..
  else
    git clone "$_gitroot" "$_gitname"
  fi

  cd $_gitname
    if [ "$(ls -A $_gitname2)" ]; then
      cd $_gitname2 && git pull origin
      msg "The local files are updated."
      cd ..
    else
      msg "Connecting to GIT server...."
      git clone "$_gitroot2" "$_gitname2"
    fi
  cd ..


  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  python2 setup.py install --prefix=/usr --root=$pkgdir
}


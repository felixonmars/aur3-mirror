# Maintainer: Daniel YC Lin <dlin.tw at gmail>
# Contributor: zorzar <zz at zoranzaric.de>
pkgname=zmqc-git
pkgver=0.0.1
pkgrel=2
pkgdesc="A small but powerful command-line interface to ØMQ."
url="http://zacharyvoase.github.com/zmqc/"
depends=('python>=2.7' 'python2-pyzmq')
makedepends=('python2-distribute')
license=('(Un)license')
replaces=('python-zmqc')
arch=('any')
source=(py27.patch)
makedepends=('git')
_gitroot="https://github.com/zacharyvoase/zmqc.git"
_gitname="zmqc"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."
  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  patch -Np1 -i ../py27.patch setup.py
  python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
md5sums=('119308a15336af036828dac0f351a9ed')

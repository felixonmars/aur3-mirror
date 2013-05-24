# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: MTsoul

pkgname=libwebsocketpp-0.3-git
pkgver=20120716
pkgrel=2
pkgdesc="C++/Boost Asio based websocket client/server library"
arch=(i686 x86_64)
url="https://github.com/zaphoyd/websocketpp/tree/master"
license=(BSD)
depends=('boost>=1.47.0')
makedepends=(git)
source=()
md5sums=()

_gitroot="git://github.com/zaphoyd/websocketpp.git"
_gitbranch="0.3.x-cmake"
_gitname="websocketpp"

build() {
  msg "Building ${pkgname}..."

  if [ -d "$_gitname" ] ; then
    warning 'Repository directory already exists!'
    cd "$_gitname"
    git checkout -f
    git reset --hard
    git clean -fd
    git clean -f
    git checkout -f "$_gitbranch"
    msg2 "Pulling..."
    git pull "$_gitroot" "$_gitbranch"

  else
    msg2 "Cloning $_gitroot repository..."
    git clone "$_gitroot" "$_gitname"
    cd "$_gitname"
    git checkout "$_gitbranch"
  fi
  if [ -d build ] ; then
	msg2 "deleting old build dir..."
	rm -rf build
  fi
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" ..
  SHARED=1 make
}

package() {
  msg "Packaging ${pkgname}..."
  cd "$_gitname/build"
  SHARED=1 make prefix="$pkgdir/usr" install
} 

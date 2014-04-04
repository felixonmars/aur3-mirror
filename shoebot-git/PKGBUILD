# Maintainer: Jon Nordby <jononor@gmail.com>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=shoebot-git
pkgver=20140303
pkgrel=3
pkgdesc="Shoebot is a pure Python graphics robot"
arch=('any')
url="http://tinkerhouse.net/shoebot/"
license=('GPL3')
depends=(python2-imaging python2-cairo pygtk python2-rsvg)
install="shoebot.install"
source=()
md5sums=()

_gitroot="git://github.org/shoebot/shoebot.git"
_gitname="shoebot"

build() {

  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  # Python2 build
  export PYTHON="python2"
  sed -i "s_env python_&2_" `grep -rlE "env python$" .`
  python2 setup.py install --prefix=/usr --root="$pkgdir/"
}

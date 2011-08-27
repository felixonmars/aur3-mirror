# Contributor: Chun <Chuck DOT Yang AT gmail>
pkgname=python-pytagcloud
pkgver=20101027
pkgrel=2
pkgdesc="python library to create simple tag clouds inspired by wordle"
arch=(any)
url="http://github.com/atizo/PyTagCloud"
license=(unknown)
depends=('python-pygame>=1.9.1')
makedepends=(git)
source=(setup.py init.patch)
md5sums=('e34b1e2702926c34c292e6e42ba25d18'
         'e039e154eb510ba7b66e2dfa93103df0')

_gitroot="git://github.com/atizo/PyTagCloud.git"
_gitname="PyTagCloud"

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
  msg "Installing..."

  cd "$srcdir/$_gitname/src"

  # apply patches and insert setup.py file
  patch -Np1 -i $srcdir/init.patch
  cp $srcdir/setup.py .

  #
  # BUILD HERE
  #

  $(which python2) setup.py install --root="$pkgdir"
  install -D -m644 ../LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

}

# vim:set ts=2 sw=2 et:

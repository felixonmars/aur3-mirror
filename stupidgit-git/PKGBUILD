# Contributor: Ferenc Boldog <ferenc.boldog@gmail.com>
pkgname=stupidgit-git
pkgver=20091127
pkgrel=2
pkgdesc="A cross-platform git GUI with strong submodule support."
arch=('i686' 'x86_64')
url="http://github.com/gyim/stupidgit"
license=('MIT')
depends=('python>=2.6' 'wxpython>=2.8' 'git>=1.6')
_gitroot="git://github.com/gyim/stupidgit.git"
_gitname="stupidgit"

noextract=()

build() {
  cd $srcdir
  msg "Connecting to GIT server...."

  if [ -d $srcdir/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf $srcdir/$_gitname-build
  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build

  msg "Starting build"

  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root=${pkgdir} --prefix=/usr || return 1
}

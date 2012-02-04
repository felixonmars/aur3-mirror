# Contributor: decay_of_mind <asparagus.maximus@gmail.com>

pkgname=pymorphy-hg
pkgver=147
pkgrel=1
pkgdesc="Python module for moprhological analysis"
arch=(any)
url="http://packages.python.org/pymorphy/"
license=('MIT')
depends=('python2')

_hgroot="http://bitbucket.org/kmike"
_hgrepo="pymorphy"

build() {
  cd $srcdir

  if [ -d $_hgrepo/.hg ]; then
    (cd $_hgrepo && hg up -r $pkgver)
  else
    hg clone -r $pkgver $_hgroot/$_hgrepo
  fi

  msg "Mercurial checkout done or server timeout"

  if [ -d $_hgrepo-build ]; then
    msg "Removing old build directory"
    rm -rf $_hgrepo-build
  fi
  
  msg "Copying repository to build directory"
  cp -r $srcdir/$_hgrepo $srcdir/$_hgrepo-build
  
  msg "Starting build"
  cd $srcdir/$_hgrepo-build

  # build
  msg "Running setup.py"

#  python setup.py build || return 1
  python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1

  msg "Dictionaries can be downloaded at http://bitbucket.org/kmike/pymorphy/downloads"
}


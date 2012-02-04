# Maintainer: archtux <antonio.arias99999 at gmail.com>

pkgname='cuevanalinks-hg'
pkgver=187
pkgrel=1
pkgdesc="A program to download movies or series from cuevana.tv"
url="https://bitbucket.org/tin_nqn/cuevanalinks"
license='GPL3'
arch=('i686' 'x86_64')
depends=('plac' 'python2-progressbar' 'python2-pyquery')
makedepends=('mercurial')
conflicts=('cuevanalinks')

_hgroot='https://bitbucket.org/tin_nqn'
_hgrepo='cuevanalinks'

build() {
   cd $srcdir

  # Update the repo, else clone a new one
   if [ -d $_hgrepo ]; then
   cd $_hgrepo
   hg pull -u
   else
   hg clone ${_hgroot}/${_hgrepo}
   cd $_hgrepo
   fi

   cd $srcdir/$_hgrepo

   python2 setup.py install --root=$pkgdir --optimize=1
}
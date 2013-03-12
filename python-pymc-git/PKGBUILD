# Contributor: Nick Ward <ward.nickjames@gmail.com>
pkgname="python-pymc-git"
pkgver=20130312
pkgrel=1
pkgdesc="Bayesian inference in Python"
url="https://github.com/pymc-devs/pymc"
depends=('python' 'python-numpy' 'python-matplotlib')
makedepends=('git' 'gcc-fortran')
optdepends=('python-scipy')
provides=('python-pymc-git')
conflicts=('python-pymc')
arch=('i686' 'x86_64')
license=('BSD')

_gitroot="git://github.com/pymc-devs/pymc.git"
_gitname="pymc"

build() {
  cd "$srcdir"
  msg "Fetching from git.."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
  else
    git clone $_gitroot
  fi

  msg "Building package.."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  unset LDFLAGS

  python setup.py config_fc --fcompiler=gfortran build
  python setup.py install --root=${pkgdir} --optimize=1 || return 1
}

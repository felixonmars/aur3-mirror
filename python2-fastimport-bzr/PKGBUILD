# Maintainer: Nuno Araujo <nuno.araujo at russo79.com>
pkgname=python2-fastimport-bzr
_realname=python-fastimport
pkgver=298
pkgrel=1
pkgdesc="Fastimport parser in Python"
arch=(any)
url="https://launchpad.net/python-fastimport"
license=('GPL')
depends=('python2' 'setuptools')
makedepends=('bzr')

_bzrtrunk=lp:$_realname
_bzrmod=$_realname

build() {
  cd $srcdir

  msg "Connecting to the server...."

  if [ -d $_bzrmod ]; then
    bzr up $_bzrmod
    msg "The local files are updated."
  else
    bzr co $_bzrtrunk $_bzrmod
  fi

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  rm -rf $_bzrmod-build
  cp -r $_bzrmod $_bzrmod-build
  cd $_bzrmod-build

  /usr/bin/python2 setup.py install --root=$startdir/pkg
}

# vim:set ts=2 sw=2 et:

# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: fredbezies <fredbezies@gmail.com>
pkgname=desktopcouch-bzr
pkgver=121
pkgrel=1
pkgdesc="A desktop implementation of couchdb. Trunk version"
arch=('any')
url="https://launchpad.net/desktopcouch"
license=('LGPL')
depends=('gnome-keyring' 'couchdb' 'gnome-python-desktop' 'python-couchdb' 'python-oauth-svn' 'pyxdg')
makedepends=('bzr' 'python-distutils-extra' 'setuptools')
provides=('desktopcouch')
conflicts=('desktopcouch')
source=()
md5sums=()

_bzrtrunk=lp:desktopcouch
_bzrmod=desktopcouch


build() {

  cd ${srcdir}

  msg "Connecting to the server...."

  if [ ! -d ./${_bzrmod} ]; then
    bzr co ${_bzrtrunk} ${_bzrmod} -r ${pkgver}
  else
    bzr up ${_bzrmod}
  fi

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  [ -d ./${_bzrmod}-build ] && rm -rf ./{$_bzrmod}-build
  cp -r ./${_bzrmod} ./${_bzrmod}-build
  cd ${srcdir}/${_bzrmod}-build
  python setup.py install --root=${pkgdir} || return 1
  rm -fr ${srcdir}/${_bzrmod}-build

}


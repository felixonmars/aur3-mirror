# Contributor: Nuno Araujo <nuno.araujo at russo79.com>
# Contributor: Mario Danic <mario.danic>

pkgname=bzr-fastimport-russo79-bzr
pkgver=306
pkgrel=1
pkgdesc="Bazzar plugin providing fast loading of revision control data - russo79 fixes"
arch=(i686 x86_64)
url="https://launchpad.net/bzr-fastimport"
license=('GPL' 'MIT')
groups=(bzr)
depends=('python2' 'setuptools' 'bzr' 'python2-fastimport-bzr')
provides=('bzr-fastimport-bzr')
conflicts=('bzr-fastimport-bzr')
makedepends=('bzr')

_bzrtrunk=lp:~russo79/bzr-fastimport/my-fixes
_bzrsrc=bzr-fastimport
_buildir=${_bzrsrc}-build

build() {
  cd ${srcdir}
  msg "Connecting to $_bzrtrunk bzr server...."
  if [ -d ${_bzrsrc} ]; then
     cd ${_bzrsrc} && bzr update
     cd ..
  else
     bzr branch ${_bzrtrunk} ${_bzrsrc}
  fi

  msg 'bzr checkout done or server timeout.'
  if [ -d ${_buildir} ]; then
     msg 'Cleaning previous build...'
     rm -rf ${_buildir}
  fi

  bzr branch ${_bzrsrc} ${_buildir}

  cd ${_buildir}
}

package() {
  cd ${srcdir}/${_buildir}
  python2 setup.py install --prefix'=/usr' --root=${pkgdir}
}

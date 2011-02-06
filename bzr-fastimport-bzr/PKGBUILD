# Contributor: Mario Danic <mario.danic>

pkgname=bzr-fastimport-bzr
pkgver=172
pkgrel=1
pkgdesc="Bazaar Fast Import is a plugin providing fast loading of revision control data into Bazaar."
arch=(i686 x86_64)
url="https://launchpad.net/bzr-fastimport"
license=('GNU GPL v2' 'MIT')
groups=(bzr)
depends=('python' 'setuptools' 'bzr')
makedepends=('bzr')
source=()
_bzrtrunk=lp:bzr-fastimport
_bzrsrc=bzr-fastimport
md5sums=()

build() {
  cd $startdir/src
  if [[ -d ${_bzrsrc} ]]; then
    (rm -rf $_bzrsrc)
  fi
  msg "Connecting to $_bzrtrunk bzr server...."
  bzr branch ${_bzrtrunk} ${_bzrsrc}
  cd $startdir/src/${_bzrsrc}
  python setup.py install --prefix'=/usr' --root=$startdir/pkg || return 1
}

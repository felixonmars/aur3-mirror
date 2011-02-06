# Contributor: Mario Danic <mario.danic>

pkgname=bzr-git-bzr
pkgver=321
pkgrel=3
pkgdesc="A plugin for bzr to read git trees. Currently has enough support for bzrk to operate."
arch=(i686 x86_64)
url="https://launchpad.net/bzr-git"
license=('GNU GPL v2')
groups=(bzr)
depends=('python' 'setuptools' 'bzr' 'dulwich-bzr')
makedepends=('bzr')
source=()
_bzrtrunk=lp:bzr-git
_bzrsrc=bzr-git
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

# Contributor: Mario Danic <mario.danic>

pkgname=bzr-rebase-bzr
pkgver=150
pkgrel=1
pkgdesc="The Bazaar rebase plugin provides support for rebasing branches much like git-rebase does in git."
arch=(i686 x86_64)
url="http://bazaar-vcs.org/Rebase"
license=('GNU GPL v2' 'MIT')
groups=(bzr)
depends=('python' 'setuptools' 'bzr')
makedepends=('bzr')
source=()
_bzrtrunk=http://people.samba.org/bzr/jelmer/bzr-rebase/trunk/
_bzrsrc=bzr-rebase
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

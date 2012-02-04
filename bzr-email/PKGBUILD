# Contributor: zhangkaizhao <zkc@zopen.cn>

pkgname=bzr-email
pkgver=0.0.1
pkgrel=40
pkgdesc="A bzr commit hook that sends emails"
arch=(i686 x86_64)
url="https://launchpad.net/bzr-email"
license=('GNU GPL v2')
groups=(bzr)
depends=('python' 'setuptools' 'bzr')
makedepends=('bzr')
source=()
_bzrtrunk=https://code.launchpad.net/bzr-email/trunk
_bzrsrc=bzr-email
md5sums=()

build() {
  cd $startdir/src
  if [[ -d ${_bzrsrc} ]]; then
    (rm -rf $_bzrsrc)
  fi
  msg "Connecting to $_bzrtrunk bzr server...."
  bzr branch -r $pkgrel ${_bzrtrunk} ${_bzrsrc}
  cd $startdir/src/${_bzrsrc}
  python setup.py install --root=$startdir/pkg || return 1
}

# Maintainer: fnord0 [fnord0 <AT> riseup <DOT> net]
# Contributor: Techlive Zheng <techlivezheng [at] gmail [dot] com>

pkgname=airdrop-ng-svn
pkgdesc="A rule based deauth tool on aircrack-ng"
pkgver=2114
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.aircrack-ng.org"
license=('GPLv2')
depends=('python2' 'python2-pylorcon' 'lorcon')
optdepends=("psyco: JIT compiler for python")
makedepends=('subversion')
conflicts=('airdrop-ng' 'aircrack-ng-scripts')
options=(!emptydirs)

_svnmod=airdrop-ng
_svntrunk="http://svn.aircrack-ng.org/trunk/scripts/airdrop-ng"

build() {
  cd ${srcdir}

  msg "Connecting to SVN server...."
  if [ -d ${_svnmod}/.svn ]; then
    msg "Updating airdrop-ng SVN..."
    svn up ${_svnmod}
  else
    msg "Checking out airdrop-ng SVN..."
    svn co ${_svntrunk} ${_svnmod}
  fi
  msg "SVN checkout done or server timeout."
  mkdir -p ${pkgdir}/usr/src || return 1
}

package() {
  cd ${srcdir}
  grep -rl python ${_svnmod} | xargs sed -i 's|python|python2|g' || return 1
  cd ${srcdir}/${_svnmod}
  python2 setup.py install --root="$pkgdir/" --optimize=1

  msg ">>> Run '/usr/bin/airdrop-ng -u' to update the OUI file"
  msg ">>> The file '/usr/share/doc/airdrop-ng/dropRules.conf.example' explains the config file syntax via examples"
}

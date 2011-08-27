# Maintainer: fnord0 [fnord0 <AT> riseup <DOT> net]
# Contributor: Techlive Zheng <techlivezheng [at] gmail [dot] com>

pkgname=airdrop-ng-svn
pkgdesc="A rule based deauth tool on aircrack-ng"
pkgver=1763
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.aircrack-ng.org"
license=('GPLv2')
depends=('python2' 'pylorcon' 'lorcon-old-svn')
optdepends=("psyco: JIT compiler for python")
makedepends=('subversion')
conflicts=('airdrop-ng' 'aircrack-ng-scripts')
source=()
install=airdrop-ng-svn.install

_svnmod=airdrop-ng
_svntrunk="http://trac.aircrack-ng.org/svn/trunk/scripts/airdrop-ng"

build() {
  cd ${srcdir}

  msg "Connecting to SVN server...."
  if [ -d ${_svnmod}/.svn ]; then
    msg "Updating airdrop-ng SVN..."
    svn up ${_svnmod} -r ${pkgver}
  else
    msg "Checking out airdrop-ng SVN..."
    svn co ${_svntrunk} -r ${pkgver} ${_svnmod}
  fi
  msg "SVN checkout done or server timeout."

  msg "Starting make..."

  if [ -d ${_svnmod}-build/ ]; then
    msg "Build exists, cleaning it up... "
    rm -rf ${_svnmod}-build || return 1
  fi

  msg "Creating build folder... "
  svn export ${_svnmod} ${_svnmod}-build

  grep -rl python ${_svnmod}-build | xargs sed -i 's|python|python2|g' || return 1
}

package() {
  cd ${srcdir}

  install -D -m755 ${_svnmod}-build/airdrop-ng                  ${pkgdir}/usr/bin/airdrop-ng                              || return 1
  install -D -m644 ${_svnmod}-build/lib/colorize.py             ${pkgdir}/usr/lib/airdrop-ng/colorize.py                  || return 1
  install -D -m644 ${_svnmod}-build/lib/libOuiParse.py          ${pkgdir}/usr/lib/airdrop-ng/libOuiParse.py               || return 1
  install -D -m644 ${_svnmod}-build/lib/libDumpParse.py         ${pkgdir}/usr/lib/airdrop-ng/libDumpParse.py              || return 1
  install -D -m644 ${_svnmod}-build/docs/airdrop-ng.1           ${pkgdir}/usr/share/man/man1/airdrop-ng.1                 || return 1
  install -D -m644 ${_svnmod}-build/README                      ${pkgdir}/usr/share/doc/airdrop-ng/README                 || return 1
  install -D -m644 ${_svnmod}-build/docs/Apple.sample.txt       ${pkgdir}/usr/share/doc/airdrop-ng/Apple.sample.txt       || return 1
  install -D -m644 ${_svnmod}-build/docs/dropRules.conf.example ${pkgdir}/usr/share/doc/airdrop-ng/dropRules.conf.example || return 1

  #Remove build directory
  rm -rf ${_svnmod}-build || return 1
}

md5sums=()

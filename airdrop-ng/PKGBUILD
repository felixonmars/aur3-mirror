# Maintainer: Techlive Zheng <techlivezheng [at] gmail [dot] com>

_pkgbase=aircrack-ng
pkgname=airdrop-ng
pkgdesc="A rule based deauth tool on aircrack-ng"
pkgver=1.1
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.aircrack-ng.org"
license=('GPLv2')
depends=('python2' 'pylorcon' 'lorcon-old-svn')
conflicts=('aircrack-ng-scripts')
source=("http://download.aircrack-ng.org/${_pkgbase}-${pkgver}.tar.gz")


build() {
  return
}

package() {
  cd ${srcdir}/${_pkgbase}-${pkgver}/scripts

  sed -i "s/python/python2/g" airdrop-ng/airdrop-ng.py

  # airdrop-ng bin
  install -Dm755 airdrop-ng/airdrop-ng.py               ${pkgdir}/usr/bin/airdrop-ng                              || return 1

  # airdrop-ng doc
  install -Dm644 airdrop-ng/README                      ${pkgdir}/usr/share/doc/airdrop-ng/README                 || return 1
  install -Dm644 airdrop-ng/docs/Apple.sample.txt       ${pkgdir}/usr/share/doc/airdrop-ng/Apple.sample.txt       || return 1
  install -Dm644 airdrop-ng/docs/dropRules.conf.example ${pkgdir}/usr/share/doc/airdrop-ng/dropRules.conf.example || return 1

  # airdrop-ng man page
  install -Dm644 airdrop-ng/docs/airdrop-ng.1           ${pkgdir}/usr/share/man/man1/airdrop-ng.1                 || return 1

  # airdrop-ng libs
  install -Dm644 airdrop-ng/lib/colorize.py             ${pkgdir}/usr/lib/airdrop-ng/colorize.py                  || return 1
  install -Dm644 airdrop-ng/lib/libOuiParse.py          ${pkgdir}/usr/lib/airdrop-ng/libOuiParse.py               || return 1
  install -Dm644 airdrop-ng/lib/libDumpParse.py         ${pkgdir}/usr/lib/airdrop-ng/libDumpParse.py              || return 1
}

md5sums=('f7a24ed8fad122c4187d06bfd6f998b4')

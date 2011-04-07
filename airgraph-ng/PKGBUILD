# Maintainer: Techlive Zheng <techlivezheng [at] gmail [dot] com>

_pkgbase=aircrack-ng
pkgname=airgraph-ng
pkgdesc="Graphing tool for the aircrack-ng suite"
pkgver=1.1
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.aircrack-ng.org"
license=('GPLv2')
depends=('python2' 'graphviz')
conflicts=('aircrack-ng-scripts')
source=("http://download.aircrack-ng.org/${_pkgbase}-${pkgver}.tar.gz")


build() {
  return
}

package() {
  cd ${srcdir}/${_pkgbase}-${pkgver}/scripts

  sed -i "s/python/python2/g" airgraph-ng/dump-join.py
  sed -i "s/python/python2/g" airgraph-ng/airgraph-ng.py

  sed -i "s:/usr/local/bin/lib:/usr/lib/airgraph-ng:g" airgraph-ng/airgraph-ng.py
  # dump-join.py (airgraph-ng)
  install -Dm755 airgraph-ng/dump-join.py           ${pkgdir}/usr/bin/dump-join                      || return 1

  # dump-join.py (airgraph-ng) man page
  install -Dm644 airgraph-ng/man/dump-join.1        ${pkgdir}/usr/share/man/man1/dump-join.1         || return 1

  # airgraph-ng bin
  install -Dm755 airgraph-ng/airgraph-ng.py         ${pkgdir}/usr/bin/airgraph-ng                    || return 1

  # airgraph-ng doc
  install -Dm644 airgraph-ng/README                 ${pkgdir}/usr/share/doc/airgraph-ng/README       || return 1

  # airgraph-ng man page
  install -Dm644 airgraph-ng/man/airgraph-ng.1      ${pkgdir}/usr/share/man/man1/airgraph-ng.1       || return 1

  # airgraph-ng libs
  install -Dm644 airgraph-ng/lib/lib_Airgraphviz.py ${pkgdir}/usr/lib/airgraph-ng/lib_Airgraphviz.py || return 1
}

md5sums=('f7a24ed8fad122c4187d06bfd6f998b4')

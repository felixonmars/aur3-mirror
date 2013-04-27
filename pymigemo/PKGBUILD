# Maintainer: anekos <anekos@snca.net>
pkgname=pymigemo
pkgver="0.4"
pkgrel=2
pkgdesc="C/Migemo binding for Python"
url="http://www.atzm.org/etc/pymigemo.html"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python2' 'cmigemo-hg' 'python2-distribute')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()

source=("http://www.atzm.org/etc/files/pymigemo/pymigemo-${pkgver}.tar.gz")
md5sums=('11de02d419c5a29360ee3fbefca574ec')

package () {
  cd "${srcdir}/pymigemo-${pkgver}"
  python2 setup.py build
  python2 setup.py install --root="${pkgdir}" --prefix="/usr"
}

# vim:set ts=2 sw=2 et:

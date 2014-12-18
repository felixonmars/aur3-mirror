# Contributor: Panos Mavrogiorgos <pmav99@gmail.com>
# Maintainer: Nidhogg

pkgname=python2-pyevtk-hg
_hgrepo="pyevtk"
pkgver=r28.0e1a3d558c34
pkgrel=1
arch=('any')
pkgdesc="EVTK (Export VTK) allows exporting data to binary VTK files for visualization and data analysis"
url="http://bitbucket.org/pauloh/pyevtk"
license=('custom')
depends=('python2-numpy')
optdepends=()
makedepends=('mercurial')
source=("hg+https://bitbucket.org/pauloh/pyevtk")
md5sums=(SKIP)

pkgver() {
  cd "$_hgrepo"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd "$srcdir/$_hgrepo"
  python2 setup.py install --root="$pkgdir"

  mkdir -p "$pkgdir/usr/share/licenses/python2-pyevtk-hg"
  cp src/LICENSE "$pkgdir/usr/share/licenses/python2-pyevtk-hg"
}

# vim:set ts=2 sw=2 et:

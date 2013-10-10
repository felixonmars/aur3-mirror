# Maintainer: Kwpolska <kwpolska@kwpolska.tk>
pkgname=python-doit-hg
_pyname=doit
_hgname=doit
pkgver=838.c6f41a396325
pkgrel=1
pkgdesc='Automation Tool (hg version)'
arch=('any')
url='http://pydoit.org/'
license=('MIT')
depends=('python' 'python-pyinotify' 'python-six')
makedepends=('mercurial')
options=(!emptydirs)
source=("hg+ssh://hg@bitbucket.org/schettino72/${_hgname}"
        "LICENSE")
md5sums=('SKIP' '7d6fd7c8e022bae9010af272c31eb45f')

package() {
  cd "${srcdir}/${_hgname}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

pkgver() {
  cd "${srcdir}/${_hgname}"
  hg identify -ni | awk 'BEGIN{OFS=".";} {print $2,$1}'
}

# vim:set ts=2 sw=2 et:

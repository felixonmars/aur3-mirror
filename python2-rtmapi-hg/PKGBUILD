# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=python2-rtmapi-hg
_pyname=RtmAPI
_hgname=rtmapi
pkgver=73.02ce238df55c
pkgrel=1
pkgdesc='API package for rememberthemilk.com  (hg version)'
arch=('any')
url='http://pypi.python.org/pypi/RtmAPI/'
license=('MIT')
depends=('python2' 'python2-httplib2')
makedepends=('mercurial')
options=(!emptydirs)
provides=('python2-rtmapi')
conflicts=('python2-rtmapi')
source=("hg+ssh://hg@bitbucket.org/michaelgruenewald/${_hgname}"
        "LICENSE")
md5sums=('SKIP' '7d6fd7c8e022bae9010af272c31eb45f')

package() {
  cd "${srcdir}/${_hgname}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

pkgver() {
  cd "${srcdir}/${_hgname}"
  hg identify -ni | awk 'BEGIN{OFS=".";} {print $2,$1}'
}

# vim:set ts=2 sw=2 et:

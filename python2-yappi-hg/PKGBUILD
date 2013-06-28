# Maintainer: Gregor Robinson <gregor@fiatflux.co.uk>

pkgname=python2-yappi-hg
_hgname='yappi'
pkgver=0.62.142
pkgrel=1
pkgdesc="Yet Another Python Profiler, but this time Thread-Aware"
arch=('any')
url=("https://bitbucket.org/sumerc/yappi")

depends=('python2')
makedepends=('mercurial')
license=('MIT')
options=(!emptydirs)
source=('hg+https://bitbucket.org/sumerc/yappi')

sha256sums=('SKIP')
conflicts=('python2-yappi')
provides=('python2-yappi')

pkgver() {
  cd "${srcdir}/${_hgname}"
  echo $(hg parents --template {latesttag}).$(hg identify -n)
}

package() {
  cd $_hgname
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:

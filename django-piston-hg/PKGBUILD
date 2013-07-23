# Maintainer: Tasos Latsas <tlatsas@gmx.com>
# Contributor: Bruno Galeotti <bravox87 at gmail dot com>

pkgname=django-piston-hg
_hgname=django-piston
pkgver=296.7c90898072ce
pkgrel=1
pkgdesc='Piston is a Django mini-framework creating APIs.'
arch=(i686 x86_64)
url='https://bitbucket.org/jespern/django-piston/'
license=('BSD')
makedepends=('mercurial')
conflicts=('django-piston')
depends=('python2-django')
source=("hg+$url")
md5sums=('SKIP')

pkgver() {
  cd $_hgname
  echo $(hg identify -n).$(hg identify -i)
}

build() {
  cd $_hgname
  python2 setup.py build
}

package() {
  cd $_hgname
  python2 setup.py install --root=$pkgdir
}

# vim: set ts=2 sw=2 et:

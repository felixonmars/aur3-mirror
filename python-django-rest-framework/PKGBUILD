# $Id$
# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid
# Package Source: https://github.com/flaccid/archlinux-packages/blob/master/python-django-rest-framework/PKGBUILD

pkgname=python-django-rest-framework
_gitname=django-rest-framework
_gituser=tomchristie
pkgver=3.0.5
pkgrel=1
pkgdesc="Awesome web-browseable Web APIs."
arch=('any')
url="https://github.com/tomchristie/django-rest-framework"
license=('custom:Tome Christie')
depends=(
  'python'
  'python-django>=1.3'
)
makedepends=('python-setuptools')
conflicts=('django-rest-framework')
replaces=('django-rest-framework')
options=(!emptydirs)
source=("https://github.com/${_gituser}/${_gitname}/archive/${pkgver}.tar.gz")
sha256sums=('2f55f4a2f8de621e91ac3bcb129382d1161e0a62cecef19bdf9dcc859273137f')

package() {
  cd "$srcdir/$_gitname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  msg 'Install requirements.txt.'
	install -D -m644 "$srcdir/$_gitname-$pkgver/requirements.txt" "$pkgdir/usr/share/doc/$_gitname/requirements.txt"
}

# vim:set ts=2 sw=2 et:

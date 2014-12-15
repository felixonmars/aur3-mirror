# $Id: PKGBUILD 225196 2014-10-22 19:02:00Z dan $
# Maintainer: Dan McGee <dan@archlinux.org>
# Contributor: Shahar Weiss <sweiss4@gmx.net>

pkgname='python-django-old'
pkgver=1.6.8
pkgrel=1
pkgdesc="A high-level Python Web framework that encourages rapid development and clean design. Old version packaged as a python-mezzanine dependency."
arch=('any')
license=('BSD')
url="http://www.djangoproject.com/"
depends=('python')
makedepends=('python' 'python-setuptools')
optdepends=('python-psycopg2: for PostgreSQL backend')
source=("django.tar.gz::https://www.djangoproject.com/download/${pkgver}/tarball/")
md5sums=('SKIP')
sha256sums=('SKIP')
conflicts=('python-django')
provides=('python-django')

build() {
  cd "$srcdir/Django-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/Django-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1

  ln -s django-admin.py "$pkgdir"/usr/bin/django-admin3.py
  ln -s django-admin "$pkgdir"/usr/bin/django-admin3
  install -Dm644 extras/django_bash_completion \
    "$pkgdir"/usr/share/bash-completion/completions/django-admin.py
  ln -s django-admin.py \
    "$pkgdir"/usr/share/bash-completion/completions/django-admin
  ln -s django-admin.py \
    "$pkgdir"/usr/share/bash-completion/completions/manage.py

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# Maintainer: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: Shahar Weiss <sweiss4@gmx.net>

pkgname=python-django
pkgver=1.5
pkgrel=1
pkgdesc="A high-level Python Web framework that encourages rapid development and clean design"
arch=('any')
license=('BSD')
url="http://www.djangoproject.com/"
depends=('python')
makedepends=('python-distribute')
optdepends=('mysql-python: for MySQL backend'
            'python-psycopg2: for PostgreSQL backend')
source=("https://www.djangoproject.com/m/releases/${pkgver:0:3}/Django-$pkgver.tar.gz")
md5sums=('fac09e1e0f11bb83bb187d652a9be967')
sha256sums=('078bf8f8ab025ed79e41ed5cee145a64dffea638eb5c2928c8cd106720824416')

build() {
  cd "$srcdir/Django-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/Django-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 extras/django_bash_completion \
    "$pkgdir"/usr/share/bash-completion/completions/django-admin.py
  ln -s django-admin.py \
    "$pkgdir"/usr/share/bash-completion/completions/manage.py

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}


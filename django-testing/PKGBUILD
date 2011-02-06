# Maintainer: Marti Raudsepp <marti@juffo.org>
# Contributor: Shahar Weiss <sweiss4@gmx.net>
# Contributor: simo <simo@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=django-testing
_pkgver=1.3-beta-1
pkgver=1.3beta1
pkgrel=1
pkgdesc="Testing version of Django, a high-level Python Web framework."
arch=('any')
license=('BSD')
url="http://www.djangoproject.com/"
depends=('python2')
makedepends=('setuptools')
optdepends=('mysql-python: for MySQL backend'
            'python-psycopg2: for PostgreSQL backend')
conflicts=('django')
provides=("django=$pkgver")
source=("http://media.djangoproject.com/releases/1.3/Django-$_pkgver.tar.gz")

build() {
  cd ${srcdir}/Django-$_pkgver
  python2 setup.py install --root=${pkgdir} --optimize=1

  install -Dm644 extras/django_bash_completion \
    ${pkgdir}/etc/bash_completion.d/django

  find $pkgdir/usr/lib/python2.7/site-packages/django/ -name '*.py' | \
    xargs sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|"

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}
md5sums=('24fbfb62714fc28676ec458710d3a862')

# $Id: PKGBUILD 169124 2012-10-18 14:48:10Z dan $
# Maintainer: Dan McGee <dan@archlinux.org>
# Contributor: Shahar Weiss <sweiss4@gmx.net>
# Contributor: Krzysztof Malinowski <boromil@gmail.com>

pkgname=pypy-django
pkgver=1.4.2
pkgrel=1
pkgdesc="A high-level Python Web framework."
arch=('any')
license=('BSD')
url="http://www.djangoproject.com/"
depends=('pypy')
makedepends=('pypy-distribute')
optdepends=()
source=("https://www.djangoproject.com/m/releases/1.4/Django-$pkgver.tar.gz")
md5sums=('6ffecdc01ad360e1abdca1015ae0893a')
sha256sums=('edfd8733f45bbaa524cee25bcac3080ce28c21242c27227464eae3fa6b3d80e7')

build() {
  cd "$srcdir/Django-$pkgver"
  pypy setup.py build
}

package() {
  cd "$srcdir/Django-$pkgver"
  pypy setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 extras/django_bash_completion \
    "$pkgdir"/opt/share/bash-completion/completions/django-admin.py
  ln -s django-admin.py \
    "$pkgdir"/opt/share/bash-completion/completions/manage.py

  find "$pkgdir"/opt/pypy/site-packages/django/ -name '*.py' | \
    xargs sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env pypy|"

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

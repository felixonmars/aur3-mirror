# Maintainer: TDY <tdy@archlinux.info>

pkgname=django-nonrel-git
pkgver=20130318
pkgrel=1
pkgdesc="A Django fork with support for NoSQL databases"
arch=('any')
url="http://django-nonrel.org/"
license=('BSD')
depends=('python2')
makedepends=('git' 'python2-distribute')
optdepends=('django-mongodb-engine: MongoDB Django module')
provides=('python2-django' 'django-nonrel')
conflicts=('python2-django' 'django-nonrel')

_gitroot=https://github.com/django-nonrel/django.git
_gitname=django-nonrel

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]]; then
    (cd $_gitname && git pull origin)
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf $_gitname-build
  git clone $_gitname $_gitname-build
  cd $_gitname-build

  find -name '*.py' -exec sed -i '1s/python/&2/' '{}' \;
  python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

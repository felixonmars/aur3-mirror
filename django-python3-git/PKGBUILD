# Maintainer: Alper KANAT <alperkanat@raptiye.org>

pkgname="django-python3-git"
pkgver=20121127
pkgrel=2
pkgdesc="A high-level Python Web framework - development python3 version."
url="http://www.djangoproject.com"
arch=('any')
license=('BSD')
depends=('python>=3.3' 'python<3.4')
makedepends=('git' 'python-distribute')
# provides=('django' 'django-svn')
# conflicts=('django')
optdepends=('mysql-python: for MySQL backend'
  'python-psycopg2: for PostgreSQL backend'
  'python-pysqlite: for SQlite backend')

_gitroot="git://github.com/django/django.git"
_gitname="django"
_gitbranch="master"

build() {
  cd "$srcdir"

  if [ -d "$srcdir/$_gitname/.git" ]; then
    cd "$_gitname"
    msg "Reset current branch"
    git reset --hard HEAD
    msg "Fetching branch $_gitbranch from $_gitroot..."
    git fetch --force --update-head-ok \
      "$_gitroot" "$_gitbranch:$_gitbranch"
    msg "Checking out branch $_gitbranch..."
    git checkout "$_gitbranch"
    git reset --hard "$_gitbranch"
    msg "The local files are updated."
  else
    msg "Cloning branch $_gitbranch from $_gitroot to $_gitname..."
    git clone --single-branch --branch "$_gitbranch" \
      "$_gitroot" "$_gitname"
    cd "$_gitname"
  fi
  msg "GIT checkout done or server timeout"

  # copying files..
  msg "Copying files..."
  cd "$srcdir/$_gitname"

  # first copying django
  python setup.py install --root="$pkgdir" --optimize=1 || return 1

  # copying license information
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # copying readme information
  install -D -m644 README.rst "$pkgdir/usr/share/doc/$pkgname/README"
  install -D -m644 INSTALL "$pkgdir/usr/share/doc/$pkgname/INSTALL"
  install -D -m644 AUTHORS "$pkgdir/usr/share/doc/$pkgname/AUTHORS"

  # copying man files
  cd "$srcdir/$_gitname/docs/man"
  install -D -m644 daily_cleanup.1 \
    "$pkgdir/usr/share/man/$pkgname/daily_cleanup.1"
  install -D -m644 django-admin.1 \
    "$pkgdir/usr/share/man/$pkgname/django-admin.1"
  install -D -m644 gather_profile_stats.1 \
    "$pkgdir/usr/share/man/$pkgname/gather_profile_stats.1"

  # copying bash completion script
  cd "$srcdir/$_gitname/extras"
  install -D -m644 django_bash_completion \
    "$pkgdir/etc/bash_completion.d/django_bash_completion3"
  sed -i "$pkgdir/etc/bash_completion.d/django_bash_completion3" \
    -e 's/django-admin/django-admin3/g'

  mv "$pkgdir/usr/bin/django-admin.py" "$pkgdir/usr/bin/django-admin3.py"

  # fix for py3k
  find "$pkgdir/usr/lib/python3.3/site-packages/django/" -name '*.py' | \
    xargs sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python3|"
}

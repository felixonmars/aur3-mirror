# Maintainer: Josh VanderLinden <arch@cloudlery.com>
# Contributor: Alper KANAT <alperkanat@raptiye.org>

# this is pretty much an exact copy of Alper's django-git PKGBUILD, but
# intended to be used with Python 3

pkgname="django-git-py3"
pkgver=20121207
pkgrel=1
pkgdesc="A high-level Python Web framework - development version for Python 3."
url="http://www.djangoproject.com"
arch=('any')
license=('BSD')
depends=('python')
makedepends=('git' 'python-distribute')
provides=('django' 'django-svn')
conflicts=('django')
optdepends=('mysql-python: for MySQL backend'
            'python-psycopg2: for PostgreSQL backend'
            'python-pysqlite: for SQlite backend')

_gitroot="git://github.com/django/django.git"
_gitname="django"

build() {
  cd $srcdir

  # checking out or updating code
  msg "Downloading source code from git server..."

  if [ -d ${srcdir}/${_gitname} ]; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout."

  # copying files..
  msg "Copying files..."
  cd $srcdir/$_gitname

  # first copying django
  python3 setup.py install --root=$pkgdir --optimize=1 || return 1

  # copying license information
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  # copying readme information
  install -D -m644 README.rst $pkgdir/usr/share/doc/$pkgname/README
  install -D -m644 INSTALL $pkgdir/usr/share/doc/$pkgname/INSTALL
  install -D -m644 AUTHORS $pkgdir/usr/share/doc/$pkgname/AUTHORS

  # copying man files
  cd $srcdir/$_gitname/docs/man
  install -D -m644 daily_cleanup.1 $pkgdir/usr/share/man/$pkgname/daily_cleanup.1
  install -D -m644 django-admin.1 $pkgdir/usr/share/man/$pkgname/django-admin.1
  install -D -m644 gather_profile_stats.1 $pkgdir/usr/share/man/$pkgname/gather_profile_stats.1

  # copying bash completion script
  cd $srcdir/$_gitname/extras
  install -D -m644 django_bash_completion $pkgdir/etc/bash_completion.d/django_bash_completion
}

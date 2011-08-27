# Maintainer: Alper KANAT <alperkanat@raptiye.org>

pkgname="django-svn"
pkgver=15402
pkgrel=1
pkgdesc="A high-level Python Web framework - development version."
arch=('any')
license=('BSD')
url="http://www.djangoproject.com"
depends=('python2')
makedepends=('subversion' 'python2-distribute')
provides=('django')
conflicts=('django')
optdepends=('mysql-python: for MySQL backend'
            'python-psycopg2: for PostgreSQL backend'
            'python-pysqlite: for SQlite backend')
source=()
md5sums=()

_svntrunk=http://code.djangoproject.com/svn/django/trunk/
_svnmod=django

build() { 
	cd $srcdir

	# checking out or updating code
	echo "Downloading sources from SVN..."
	if [[ -d "$_svnmod" ]]; then
		svn up -r $pkgver
	else
		svn co $_svntrunk -r $pkgver $_svnmod
	fi

	# copying files..
	echo "Copying files..."
	cd $srcdir/$_svnmod

	# first copying django
	python2 setup.py install --root=$pkgdir --optimize=1 || return 1

	# copying license information
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

	# copying readme information
	install -D -m644 README $pkgdir/usr/share/doc/$pkgname/README
	install -D -m644 INSTALL $pkgdir/usr/share/doc/$pkgname/INSTALL

	# copying man files
	cd $srcdir/$_svnmod/docs/man
	install -D -m644 daily_cleanup.1 $pkgdir/usr/share/man/$pkgname/daily_cleanup.1
	install -D -m644 django-admin.1 $pkgdir/usr/share/man/$pkgname/django-admin.1
	install -D -m644 gather_profile_stats.1 $pkgdir/usr/share/man/$pkgname/gather_profile_stats.1

	# copying bash completion script
	cd $srcdir/$_svnmod/extras
	install -D -m644 django_bash_completion $pkgdir/etc/bash_completion.d/django_bash_completion

    # fix for py2k
    find $pkgdir/usr/lib/python2.7/site-packages/django/ -name '*.py' | \
        xargs sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|"
}

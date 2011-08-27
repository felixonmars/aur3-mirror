# Maintainer: Alper Kanat <alperkanat@raptiye.org>

pkgname=django-rosetta-svn
pkgver=112
pkgrel=1
pkgdesc="An application that eases the translation process of your django projects"
arch=('any')
url="http://code.google.com/p/django-rosetta/"
license=('MIT')
depends=('django' 'python2')
makedepends=('python2-distribute' 'subversion')
provides=("django-rosetta")
conflicts=("django-rosetta")
source=()
md5sums=()

_svntrunk=http://django-rosetta.googlecode.com/svn/trunk/
_svnmod=django-rosetta

build() { 
    cd "$srcdir"

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

    # fix for py2k
    find $pkgdir/usr/lib/python2.7/site-packages/rosetta/ -name '*.py' | \
        xargs sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|"
}

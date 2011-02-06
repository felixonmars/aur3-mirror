# Contributor: Ryan Coyner <rcoyner@gmail.com>
# Contributor: Rémi Audebert <quaero.galileo@gmail.com>

pkgname=django-evolution-svn
pkgver=198
pkgrel=1
pkgdesc="Schema Evolution for the Django Project"
arch=('any')
url="http://code.google.com/p/django-evolution"
license=('BSD')
depends=('python2')
makedepends=('subversion')
provides=('django-evolution')

_svntrunk=http://django-evolution.googlecode.com/svn/trunk/
_svnmod=django-evolution

build() {
    cd "$srcdir"

    if [ -d $_svnmod/.svn ]; then
        (cd $_svnmod && svn up -r $pkgver)
    else
        svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi

    msg "SVN checkout done or server timeout"

    rm -rf "$srcdir/$_svnmod-build"
    cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
    cd "$srcdir/$_svnmod-build"

    msg "Starting setup.py..."

    python2 setup.py install --root=$pkgdir/ --optimize=1 || return 1
    install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# Contributor: Ryan Coyner <rcoyner@gmail.com>
# Contributor: Rémi Audebert <quaero.galileo@gmail.com>

pkgname=django-contact-form-hg
pkgver=61
pkgrel=2
pkgdesc="An extensible contact-form application for Django"
arch=('any')
url="http://bitbucket.org/ubernostrum/django-contact-form"
license=('BSD')
depends=('python')
makedepends=('mercurial')
provides=('django-contact-form')
conflicts=('django-contact-form')

_hgroot="http://bitbucket.org/ubernostrum/django-contact-form"
_hgrepo="django-contact-form"

build() { 
    cd "$srcdir"
    msg "Connecting to Mercurial server...."

    if [ -d $_hgrepo ] ; then
        cd $_hgrepo
        hg pull -u || return 1
        msg "The local files are updated."
    else
        hg clone $_hgroot $_hgrepo || return 1
    fi

    msg "Mercurial checkout done or server timeout"

    rm -rf "$srcdir/$_hgrepo-build"
    cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
    cd "$srcdir/$_hgrepo-build"

    msg "Starting setup.py..."

    python setup.py install --root=$pkgdir/ --optimize=1 || return 1
    install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

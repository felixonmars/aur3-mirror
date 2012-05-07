# Maintainer: Jon Eyolfson <jon@eyolfson.com>
pkgname=python2-django-cas-hg
_pkgname=django-cas
pkgver=42
pkgrel=1
pkgdesc="CAS (Central Authentication Service) middleware for Django"
arch=('any')
url="https://bitbucket.org/cpcc/django-cas/overview/"
license=('MIT')
depends=('python2')
makedepends=('mercurial')
provides=('python2-django-cas')
conflicts=('python2-django-cas')

_hgroot="https://bitbucket.org/cpcc/django-cas"
_hgrepo="${_pkgname}"

build() {
    cd "$srcdir"
    msg "Connecting to Mercurial server...."

    if [[ -d "$_hgrepo" ]]; then
        cd "$_hgrepo"
        hg pull -u
        msg "The local files are updated."
    else
        hg clone "$_hgroot" "$_hgrepo"
    fi

    msg "Mercurial checkout done or server timeout"
    msg "Starting build..."

    rm -rf "$srcdir/$_hgrepo-build"
    cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
    cd "$srcdir/$_hgrepo-build"

    python2 setup.py build
}

package() {
    cd "$srcdir/$_hgrepo-build"
    python2 setup.py install --root="$pkgdir" --optimize=1
}

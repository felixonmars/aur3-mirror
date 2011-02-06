# Maintainer: Vladimir Gorbunov <truedaemon@gmail.com>
# Contributor: Gour <gour@gour-nitai.com>
pkgname=django-feincms-git  
pkgver=20101218
pkgrel=1 
pkgdesc="Django-based Page CMS and CMS building toolkit"
arch=('any')
url="http://github.com/matthiask/feincms/tree/master"
license=('BSD')
depends=('python2' 'django' 'django-tagging-svn' 'django-mptt-git')
makedepends=('git')
conflicts=('django-feincms')
provides=('django-feincms')
source=()
md5sums=()

_gitroot="git://github.com/matthiask/feincms.git"
_gitname="feincms"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
	cd $_gitname && git pull origin
	msg "The local files are updated."
    else
	git clone $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"

}

package () {
    cd "$srcdir/$_gitname-build"
    python2 setup.py install --root=$pkgdir/ --optimize=1 || return 1
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

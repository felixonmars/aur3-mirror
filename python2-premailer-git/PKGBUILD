# Contributor: John K. Luebs <jkluebs@luebsphoto.com>

pkgname=python2-premailer-git
pkgver=20120721
pkgrel=1
pkgdesc="Turns CSS blocks into style attributes"
arch=('any')
url='http://pypi.python.org/pypi/premailer/'
license=('BSD')
depends=('python2' 'python2-lxml')
makedepends=('setuptools')
conflicts=('python2-premailer')
source=()
md5sums=()

_gitroot='https://github.com/peterbe/premailer.git'
_gitname='premailer'

build () {
    cd "$srcdir"
    msg "Connecting to git server..."
    if [[ -d $_gitname ]]; then
	cd $_gitname && git pull origin
	msg "The local files are up-to-date"
    else
	git clone $_gitroot $_gitname --depth=1
	cd $_gitname
    fi

    python2 setup.py build
}

package () {
    cd "$srcdir/$_gitname"
    python2 setup.py install --root=${pkgdir} --optimize=1

    install -D LICENSE "$pkgdir/usr/share/licenses/python2-premailer-git/LICENSE"
}

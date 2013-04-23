# Maintainer: Alper KANAT <alperkanat@raptiye.org>

pkgname=django-markitup-hg
pkgver=20130424
pkgrel=1
pkgdesc="A Django reusable application for end-to-end markup handling."
url="https://bitbucket.org/carljm/django-markitup/"
arch=('any')
license=('BSD')
makedepends=("mercurial" "python2-distribute")
depends=("python2" "python2-django")

_hgroot="https://bitbucket.org/carljm/django-markitup"
_hgname="django-markitup"

build() {
	cd $srcdir
	msg "Connecting to Mercurial server..."

	if [ -d $srcdir/$_hgname ]; then
		cd $_hgname && hg pull -u
		msg "The local files are updated."
	else
		hg clone $_hgroot $_hgname
	fi

	msg "Mercurial checkout done or server timeout"
	msg "Starting make..."

	cd $srcdir/$_hgname
	python2 setup.py build || return 1
	python2 setup.py install --root=$pkgdir || return 1
}

package() {
    cd $srcdir/$_hgname

	msg "Installing license..."
    install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/$_hgname/LICENSE.txt

    msg "Installing docs..."
    mkdir -p $pkgdir/usr/share/doc/$_hgname
    install -Dm644 AUTHORS.rst $pkgdir/usr/share/doc/$_hgname/AUTHORS.rst
    install -Dm644 CHANGES.rst $pkgdir/usr/share/doc/$_hgname/CHANGES.rst
    install -Dm644 README.rst $pkgdir/usr/share/doc/$_hgname/README.rst
    install -Dm644 TODO.rst $pkgdir/usr/share/doc/$_hgname/TODO.rst
    install -Dm644 tox.ini $pkgdir/usr/share/doc/$_hgname/tox.ini
}

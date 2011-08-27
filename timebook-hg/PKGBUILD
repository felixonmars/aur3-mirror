# Contributor: Marcus Fredriksson <drmegahertz@gmail.com>
pkgname='timebook-hg'
pkgver=64
pkgrel=2
pkgdesc="Track what you spend time on"
url="http://bitbucket.org/trevor/timebook/"
license=('MIT')
arch=('any')
depends=('python2')
makedepends=('mercurial' 'python2-distribute')
provides=('timebook')
source=()
md5sums=()

_hgroot='http://bitbucket.org/trevor'
_hgrepo='timebook'

build() {
	cd "$srcdir"
    msg "Connecting to Mercurial server..."

	if [ -d $_hgrepo ]; then
		cd $_hgrepo
		hg pull -u
        msg "The local files are updated."
	else
		hg clone ${_hgroot}/${_hgrepo}
		cd $_hgrepo
	fi

    msg "Mercurial checkout done or server timeout."
    msg "Building package..."
    python2 setup.py install --root="$startdir"/pkg --optimize=1 || return 1

    msg "Adding documentation..."
    install -D -m644 "$srcdir"/timebook/README "$pkgdir"/usr/share/doc/timebook/README
}

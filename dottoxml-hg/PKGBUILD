# Maintainer: FrozenCow <frozencow@gmail.com> 

pkgname=dottoxml-hg
pkgver=10.97a0c40558ea
pkgrel=2
pkgdesc="Converts DOT graph files to Graphml (an XML DTD that is used by the yEd graph editor) and other formats."
arch=('i686' 'x86_64')
url="https://bitbucket.org/dirkbaechle/dottoxml/"
license=('GPL2')
depends=('pacman' 'python2')
provides=('dottoxml')
makedepends=('mercurial')
source=("$pkgname"::'hg+https://bitbucket.org/dirkbaechle/dottoxml' 'dottoxml')
md5sums=('SKIP' '6189b63844b836ac5c5e7d166585b5e4')

pkgver() {
	cd "$pkgname"
printf "%s.%s" "$(hg identify -n)" "$(hg identify -i)" > /tmp/koek 2>&1
	printf "%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
	mkdir -p "$pkgdir/usr/lib/dottoxml" "$pkgdir/usr/bin"
	install -Dm644 "$srcdir/$pkgname/src/X11Colors.py" "$pkgdir/usr/lib/dottoxml/X11Colors.py"
	install -Dm644 "$srcdir/$pkgname/src/dot.py" "$pkgdir/usr/lib/dottoxml/dot.py"
	install -Dm644 "$srcdir/$pkgname/src/dottoxml.py" "$pkgdir/usr/lib/dottoxml/dottoxml.py"
	install -Dm755 "$srcdir/dottoxml" "$pkgdir/usr/bin/dottoxml" 
}

# Maintainer: Thorsten Töpper <atsutane-aur@freethoughts.de>

pkgname=objfw-docs-hg
pkgver=1122
pkgrel=1
pkgdesc="A portable framework for the Objective C language - Documentation"
arch=('any')
url="https://webkeks.org/objfw"
license=('custom:QPL' 'GPL2' 'GPL3')
provides=('objfw-docs')
conflicts=('objfw-docs')
makedepends=('mercurial' 'doxygen')

_hgroot=https://webkeks.org/hg
_hgrepo=objfw

build() {
	cd "$srcdir"

	if [ -d "$_hgrepo" ]; then
		cd "$srcdir/$_hgrepo"
    hg pull -u
	else
		hg clone "$_hgroot/$_hgrepo"
	fi

	msg "Mercurial checkout done or server timeout"
	msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
	cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
	cd "$srcdir/$_hgrepo-build"
	
  doxygen
}

package() {
  cd "$srcdir/$_hgrepo-build"
  
  install --directory "$pkgdir/usr/share/doc/objfw/"
  cp -r docs/* "$pkgdir/usr/share/doc/objfw/"
  install -Dm644 LICENSE.QPL "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:


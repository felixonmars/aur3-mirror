# Maintainer: Thorsten Töpper <atsutane-aur@freethoughts.de>

pkgname=objfw-hg
pkgver=1122
pkgrel=1
pkgdesc="A portable framework for the Objective C language."
arch=('i686' 'x86_64')
url="https://webkeks.org/objfw"
license=('custom:QPL' 'GPL2' 'GPL3')
provides=('objfw')
conflicts=('objfw')
replaces=('libobjfw-hg')
depends=('gcc-libs' 'sh')
makedepends=('mercurial' 'gcc-objc')
optdepends=('gcc-objc: For active usage of this framework.')

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
	
  ./autogen.sh
	./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_hgrepo-build"
	make DESTDIR=${pkgdir} install

  install -Dm644 LICENSE.QPL "$pkgdir/usr/share/licenses/$pkgname/LICENSE.QPL"
}

# vim:set ts=2 sw=2 et:


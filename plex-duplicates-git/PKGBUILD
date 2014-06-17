# $Id$
# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid
# Package Source: https://github.com/flaccid/archlinux-packages/blob/master/plex-duplicates-git/PKGBUILD

_gitname=plex-duplicates
pkgname=${_gitname}-git
pkgver=0.0.0
pkgrel=2
pkgdesc="Find duplicate movie files in Plex Media Server."
arch=('any')
url="https://github.com/pstadler/plex-duplicates"
license=('custom')
depends=(
  ruby
  ruby-colored
  ruby-plex-ruby
)
options=(!emptydirs)
source=(
	"git://github.com/pstadler/${_gitname}.git"
	bundler_to_require.patch
)
md5sums=(
	SKIP
	427d2918ac5235a9621e2b74ebb836e4
)

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
	install -Dm755 "$srcdir/$_gitname/duplicates.rb" "${pkgdir}"/usr/local/bin/duplicates.rb
	pushd "$pkgdir/usr/local/bin"
    	msg "Applying bundler_to_require patch..."
    	patch -p0 < "$startdir/bundler_to_require.patch"
	popd
}

# vim:set ts=2 sw=2 et:

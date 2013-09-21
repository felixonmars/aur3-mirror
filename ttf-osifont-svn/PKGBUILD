# Contributor : Carlos J. Ruiz-Henestrosa <ruizh dot cj at gmail dot com>

pkgname=ttf-osifont-svn
pkgver=148
pkgrel=1
pkgdesc="TrueType font for CAD - ISO 3098"
arch=any
license="GPLv3"
url="http://code.google.com/p/osifont"
install=ttf.install
depends=('xorg-fonts-encodings' 'xorg-fonts-alias' 'xorg-font-utils' 'fontconfig')
makedepends='subversion'
conflicts='ttf-osifont'
provides='ttf-osifont'
source='local_repo::svn+http://osifont.googlecode.com/svn/trunk'
md5sums='SKIP'

pkgver() {
	cd local_repo
	local ver="$(svnversion)"
	printf "%s" "${ver//[[:alpha:]]}"
}

package() {
	local destdir="$pkgdir/usr/share/fonts/TTF"
	mkdir -p $destdir
	install -m644 local_repo/*.ttf "$destdir/"
}

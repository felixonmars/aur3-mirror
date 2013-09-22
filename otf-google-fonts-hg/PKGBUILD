# Maintainer: Nathan Maxson <joyfulmantis at gmail dot com>
# Contributor: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Michalis Georgiou <mechmg93@gmail.comr>
# Contributor: Alexander De Sousa <archaur.xandy21@spamgourmet.com>

#
#     NOTE:
#        otf-google-fonts-hg (this package) pulls down the entire tree from
#        the official upstream Google Fonts merucrial repository, and extracts
#        the otf files
# 
#        ttf-google-fonts-hg pulls down the entire tree from the official
#        upstream Google Fonts merucrial repository, and extracts the ttf files
#
#        ttf-google-fonts-git pulls from a much smaller and leaner, and unofficial
#        repository that only contains the ttf files and is hosted on GitHub.
#

pkgname=otf-google-fonts-hg
pkgver=3400.2357c0b4dce3
pkgrel=1
pkgdesc='Various OpenType fonts from the Google Fonts Directory (uses official upstream sources)'
arch=('any')
url='https://www.google.com/fonts'
license=('various')
depends=('fontconfig'
         'xorg-fonts-encodings'
         'xorg-mkfontdir'
         'xorg-mkfontscale')
makedepends=('mercurial')
conflicts=()
provides=()
install=otf-google-fonts-hg.install
_hgname=googlefontdirectory
source=("$_hgname::hg+https://googlefontdirectory.googlecode.com/hg/")
sha1sums=('SKIP')

pkgver() {
	cd "$srcdir/$_hgname"
	hg identify -ni | awk 'BEGIN{OFS=".";} {print $2,$1}'
}

package() {
	cd "$srcdir"
	install -dm755 "$pkgdir/usr/share/fonts/OTF"
	find . -type f -name \*.otf -exec install -Dm644 '{}' \
		"$pkgdir/usr/share/fonts/OTF" \;
}

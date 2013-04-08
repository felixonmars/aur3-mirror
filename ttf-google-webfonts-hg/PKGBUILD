# Maintainer: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Michalis Georgiou <mechmg93@gmail.comr>
# Contributor: Alexander De Sousa <archaur.xandy21@spamgourmet.com>

#
#     NOTE:
#        ttf-google-webfonts-hg (this package) pulls down the entire
#        Mercurial repository from the official upstream Web Fonts project.
#
#        ttf-google-webfonts-git (an alternative package) pulls from a much
#        smaller and leaner unofficial repository hosted on GitHub.
#

pkgname=ttf-google-webfonts-hg
pkgver=3231.3887d256cf56
pkgrel=1
pkgdesc="Various TrueType fonts from Google's Web Fonts project (uses official upstream sources)"
arch=('any')
url="https://www.google.com/fonts"
license=('various')
depends=('fontconfig'
         'xorg-fonts-encodings'
         'xorg-mkfontscale')
makedepends=('mercurial')
conflicts=('ttf-google-webfonts'
           'ttf-google-webfonts-git'
           'jsmath-fonts'
           'lohit-fonts'
           'otf-goudy'
           'ttf-andika'
           'ttf-anonymous-pro'
           'ttf-cantarell'
           'ttf-cardo'
           'ttf-chromeos-fonts'
           'ttf-droid'
           'ttf-inconsolata'
           'ttf-kimberly_geswein_print'
           'ttf-medievalsharp'
           'ttf-nova'
           'ttf-oldstandard'
           'oldstand-font'
           'ttf-opensans'
           'ttf-oxygen'
           'ttf-pt-mono'
           'ttf-ptsans'
           'ttf-pt-sans'
           'ttf-roboto'
           'ttf-sil-fonts'
           'ttf-sortsmillgoudy'
           'ttf-source-code-pro'
           'ttf-source-sans-pro'
           'ttf-ubuntu-font-family'
           'ttf-vollkorn')
provides=("${conflicts[@]}" 'ttf-font')
# Uncomment the following lines if you want
#replaces=('ttf-google-webfonts'
#          'ttf-google-webfonts-git')
install=ttf.install
_hgname=googlefontdirectory
source=("$_hgname::hg+https://googlefontdirectory.googlecode.com/hg/")
sha1sums=('SKIP')

pkgver() {
	cd "$srcdir/$_hgname"
	hg identify -ni | awk 'BEGIN{OFS=".";} {print $2,$1}'
}

package() {
	cd "$srcdir"
	install -dm755 "$pkgdir/usr/share/fonts/TTF"
	find . -maxdepth 4 -type f -name \*.ttf -exec install -Dm644 '{}' \
		"$pkgdir/usr/share/fonts/TTF" \;
}

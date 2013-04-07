# Maintainer:  Sebastian Stammler <stammler.s@gmail.com>
#
# This is the git version (more sensible) of
# https://aur.archlinux.org/packages.php?ID=37334
# (Sarkasper <echo a2FzcGVyLm1lbnRlbkBnbXguY29tCg== | base64 -d>)
#
# Now pacman 4.1 ready!
# For improvements/fixes to this package, please send me a
# pull request on github: https://github.com/sebastianst/aur-packages
# 
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Michalis Georgiou <mechmg93@gmail.comr>
# Contributor: Alexander De Sousa <archaur.xandy21@spamgourmet.com>

pkgname=ttf-google-webfonts-git
pkgver=20130401
pkgrel=1
pkgdesc="Google Web Fonts catalogue. Git version."
arch=('any')
url="https://github.com/w0ng/googlefontdirectory"
license=('various')
depends=('fontconfig' 'xorg-fonts-encodings')
makedepends=(git)
conflicts=('googlefontdirectory'
           'jsmath-fonts'
           'lohit-fonts'
           'oldstand-font'
           'otf-goudy'
           'ttf-andika'
           'ttf-anonymous-pro'
           'ttf-cantarell'
           'ttf-cardo'
           'ttf-chromeos-fonts'
           'ttf-droid'
           'ttf-google-webfonts-hg'
           'ttf-inconsolata'
           'ttf-kimberly_geswein_print'
           'ttf-nova'
           'ttf-oldstandard'
           'ttf-pt-mono'
           'ttf-pt-sans'
           'ttf-ptsans'
           'ttf-roboto'
           'ttf-sil-fonts'
           'ttf-sortsmillgoudy'
           'ttf-source-code-pro'
           'ttf-source-sans-pro'
           'ttf-ubuntu-font-family'
           'ttf-vollkorn'
	   'ttf-google-webfonts'
	   'ttf-oxygen'
	   'ttf-opensans'
	   'ttf-medievalsharp')
provides=("${conflicts[@]}")
source=("git://github.com/w0ng/googlefontdirectory.git")
md5sums=('SKIP')
install=font.install

# git variables
_gitname="googlefontdirectory"

pkgver() {
  cd "$srcdir/$_gitname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  find . -type f -name \*.ttf -exec install -Dm644 '{}' \
    "$pkgdir/usr/share/fonts/TTF" \;
}

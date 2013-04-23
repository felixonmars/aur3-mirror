# Maintainer: David J. Haines <echo ZGpoYWluZXNAZ214LmNvbQo= | base64 -d>
# Contributor: Sarkasper <echo a2FzcGVyLm1lbnRlbkBnbXguY29tCg== | base64 -d>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Michalis Georgiou <mechmg93@gmail.comr>
# Contributor: Alexander De Sousa <archaur.xandy21@spamgourmet.com>

pkgname=ttf-google-webfonts-tarball
pkgver=20130414
pkgrel=1
pkgdesc="Google Web Fonts catalogue, tarball version."
arch=('any')
url="http://code.google.com/p/googlefontdirectory/issues/detail?id=2"
license=('various')
depends=('fontconfig' 'xorg-fonts-encodings')
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
           'ttf-google-webfonts-git'
           'ttf-oxygen'
           'ttf-opensans'
           'ttf-medievalsharp')
provides=("${conflicts[@]}")
install=font.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/w0ng/googlefontdirectory/archive/master.tar.gz")

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  find . -type f -name \*.ttf -exec install -Dm644 '{}' \
    "$pkgdir/usr/share/fonts/TTF" \;
}

md5sums=('2f1d413a5f1c8caadd8c41f39f41be26')

# Contributor: Sarkasper <echo a2FzcGVyLm1lbnRlbkBnbXguY29tCg== | base64 -d>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Michalis Georgiou <mechmg93@gmail.comr>
# Contributor: Alexander De Sousa <archaur.xandy21@spamgourmet.com>
# Contributor: Gently <toddrpartridge@gmail.com>

pkgname=ttf-google-webfonts-distilled
pkgver=130119
pkgrel=1
pkgdesc="Google Web Fonts catalogue (distilled-list)."
arch=('any')
url="http://code.google.com/p/googlefontdirectory/issues/detail?id=2"
license=('various')
depends=('fontconfig' 'xorg-fonts-encodings')
conflicts=('googlefontdirectory'
           'jsmath-fonts'
           'lohit-fonts'
           'oldstand-font'
           'sintony'
           'otf-goudy'
           'ttf-andika'
           'ttf-anonymous-pro'
           'ttf-cantarell'
           'ttf-cardo'
           'ttf-chromeos-fonts'
           'ttf-droid'
           'ttf-google-webfonts'
           'ttf-google-webfonts-hg'
           'ttf-inconsolata'
           'ttf-kimberly_geswein_print'
           'ttf-nova'
           'ttf-oldstandard'
           'ttf-oxygen'
           'ttf-pt-mono'
           'ttf-pt-sans'
           'ttf-ptsans'
           'ttf-roboto'
           'ttf-sil-fonts'
           'ttf-sortsmillgoudy'
           'ttf-source-code-pro'
           'ttf-source-sans-pro'
           'ttf-ubuntu-font-family'
           'ttf-vollkorn')
provides=("${conflicts[@]}")
install=font.install
source=('https://github.com/w0ng/googlefontdirectory/tarball/master')
md5sums=('e6597b5d4f2fd64f0dde881140b65ba4')

package() {

  font_incl=(OpenSans Oswald Droid Lato PT YanoneKaffeesatz Ubuntu Ninoto Arvo Lobster SourceSansPro Lora FrancoisOne Rokkitt Exo TheGirlNextDoor Raleway Arimo Bitter Rufina)

  cd "$srcdir"
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  #find . -type f -name \*.ttf -exec install -Dm644 '{}' \
  #  "$pkgdir/usr/share/fonts/TTF" \;
  for f in "${font_incl[@]}"; do
    find . -type f -name "$f"*.ttf -exec install -Dm644 '{}' \
    "$pkgdir/usr/share/fonts/TTF" \;
  done

}

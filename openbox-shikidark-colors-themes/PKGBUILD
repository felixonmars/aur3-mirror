# Contributor: grimi <grimi at poczta dot fm>

pkgname=openbox-shikidark-colors-themes
pkgver=1.0
pkgrel=1
pkgdesc="Openbox themes to match Shiki Colors and Clearlooks/Murrine Dark Colors"
arch=('any')
url="http://www.box-look.org/content/show.php/Shiki%2BDark+Colors?content=105711"
license=('GPL')
depends=('openbox')
source=("http://www.box-look.org/CONTENT/content-files/105711-dark-colors-openbox.tar.gz")
md5sums=('4a3a0b5bd3772e5551bc828f913b7409')

build() {
  cd "$srcdir/dark-colors-openbox"
  install -d "$pkgdir/usr/share/themes"
  for x in *; do
     install -d "$pkgdir/usr/share/themes/$x/openbox-3"
     install -m644 "$x/openbox-3/"{*.xbm,themerc} "$pkgdir/usr/share/themes/$x/openbox-3"
  done
}


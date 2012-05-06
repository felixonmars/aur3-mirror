# Contributor: JokerBoy <jokerboy at punctweb dot ro>

pkgname=gtk-murrina-blu-theme
pkgver=0.33
pkgrel=1
pkgdesc="MurrinaBlu, a simple murrine-based theme."
arch=('any')
url="http://gnome-look.org/content/show.php?content=96356"
license=('GPL')
depends=('gtk-engine-murrine')
source=("http://gnome-look.org/CONTENT/content-files/96356-MurrinaBlu.tar.gz"
        "fix_missing_gradients.diff")
md5sums=('e70c268e3fb4b5e6c238b25b8b00264c'
         'c95c71293d51c41faeaf81f77de1061a')

package() {
  cd "$srcdir/MurrinaBlu"
  patch -Np1 -i "$srcdir/fix_missing_gradients.diff"
  install -Dm 644 "$srcdir/MurrinaBlu/gtk-2.0/gtkrc" "$pkgdir/usr/share/themes/MurrinaBlu/gtk-2.0/gtkrc"
}

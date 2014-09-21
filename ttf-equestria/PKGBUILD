pkgname=ttf-equestria
pkgver=20140919
pkgrel=1
pkgdesc="Based on the package logos for Hasbro's My Little Pony Line. Includes full alphabet, extended characters and punctuation, and Euro."
arch=(any)
url="http://www.dafont.com/equestria.font"
license=("unknown")
depends=(fontconfig xorg-font-utils)
source=("equestria.zip::http://img.dafont.com/dl/?f=equestria")
md5sums=('5cbfa71684abbfd0c901e16ad931c628')
install="$pkgname.install"

package()
{
  install -Dm644 "$srcdir/Equestria.otf" "$pkgdir/usr/share/fonts/TTF/Equestria.otf"
  install -Dm644 "$srcdir/Equestria Italic.otf" "$pkgdir/usr/share/fonts/TTF/Equestria Italic.otf"
  install -Dm644 "$srcdir/Equestria Bold.otf" "$pkgdir/usr/share/fonts/TTF/Equestria Bold.otf"
  install -Dm644 "$srcdir/Font License.txt" "$pkgdir/usr/share/licenses/ttf-equestria/Font License.txt"
}

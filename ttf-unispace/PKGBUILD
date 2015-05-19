pkgname=ttf-unispace
pkgver=1.0
pkgrel=1
pkgdesc="Unispace font by Ray Larabie"
arch=(any)
url="http://www.dafont.com/unispace.font"
depends=(fontconfig xorg-font-utils)
source=(unispace.zip::http://dl.dafont.com/dl/?f=unispace)
install=$pkgname.install
md5sums=('4513ad83691fa1ef4090e4eb4db72b54')

package() {
  cd "$srcdir"
  install -Dm644 "unispace rg.ttf" "$pkgdir/usr/share/fonts/TTF/unispace_rg.ttf"
  install -Dm644 "unispace it.ttf" "$pkgdir/usr/share/fonts/TTF/unispace_it.ttf"
  install -Dm644 "unispace bd.ttf" "$pkgdir/usr/share/fonts/TTF/unispace_bd.ttf"
  install -Dm644 "unispace bd it.ttf" "$pkgdir/usr/share/fonts/TTF/unispace_bd_it.ttf"
  install -Dm644 typodermic-eula-02-2014.pdf "$pkgdir/usr/share/licenses/$pkgname/license.pdf"
}


pkgname=ttf-trigger-bold
pkgver=2
pkgrel=1
pkgdesc="Chrono Trigger bold faced font"
arch=('any')
url="http://www.chronocompendium.com/"
license=('Creative Commons')
depends=('fontconfig' 'xorg-font-utils')
source=("http://chronofan.com/Black/Other/trigger_bold.zip")
md5sums=('825fc6c713564a14ca84f5ad188a3ecb')
install=$pkgname.install

build()
{
  install -Dm644 "$srcdir/trigger_bold.ttf" "$pkgdir/usr/share/fonts/TTF/trigger_bold.ttf"
  install -Dm644 "$srcdir/license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgname=ttf-trigger-mono
pkgver=1
pkgrel=1
pkgdesc="Chrono Trigger monospaced font"
arch=('any')
url="http://www.chronocompendium.com/"
license=('Creative Commons')
depends=('fontconfig' 'xorg-font-utils')
source=("http://chronofan.com/Black/Other/trigger_mono.zip")
md5sums=('19b16be7acba147db6453e751d3dd632')
install=$pkgname.install

build()
{
  install -Dm644 "$srcdir/trigger_mono.ttf" "$pkgdir/usr/share/fonts/TTF/trigger_mono.ttf"
  install -Dm644 "$srcdir/license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

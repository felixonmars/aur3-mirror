pkgname=ttf-trigger-light
pkgver=1
pkgrel=1
pkgdesc="Chrono Trigger light font"
arch=('any')
url="http://www.chronocompendium.com/"
license=('Creative Commons')
depends=('fontconfig' 'xorg-font-utils')
source=("http://chronofan.com/Black/Other/trigger_light.zip")
md5sums=('827d1c841802fb44fede3ac94350868c')
install=$pkgname.install

package()
{
  install -Dm644 "$srcdir/trigger_light.ttf" "$pkgdir/usr/share/fonts/TTF/trigger_light.ttf"
  install -Dm644 "$srcdir/license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

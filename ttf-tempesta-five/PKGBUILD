# Maintainer: Aleksander Nitecki <ixendr@itogi.re>

pkgname=ttf-tempesta-five
pkgver=1.3
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Tempesta five font pack."
arch=('any')
url="http://p.yusukekamiyamane.com/"
license="Unknown"
source=(http://p.yusukekamiyamane.com/fonts/downloads/tempesta-five-fonts-${pkgver}.zip)
md5sums=('0a99cdffc36f5fe6384c9cc32b8ec55d')
install=$pkgname.install

package() {
  find . -name "*.ttf" -exec install -Dm 644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;
}

# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=vavoom-models
pkgver=1.4.3
pkgrel=2
pkgdesc="MD2 3D models for the Vavoom Doom engine port"
arch=('any')
url="http://www.vavoom-engine.com/"
license=('unknown')
depends=('vavoom')
source=(http://downloads.sourceforge.net/vavoom/vmodels-doom-$pkgver.zip \
	http://downloads.sourceforge.net/vavoom/vmodels-strife-$pkgver.zip)
md5sums=('6f977e155fe5465924bda6aa442a2a49'
         '99cee3ff92bb97e47bffd497a784f535')

build() {
  mkdir -p "$pkgdir"/usr/share/vavoom
  cp -rf basev/ "$pkgdir"/usr/share/vavoom/

  find "$pkgdir" -type f -exec chmod 644 {} \;
}

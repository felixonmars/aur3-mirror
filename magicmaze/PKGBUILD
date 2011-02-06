# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=magicmaze
pkgver=1.4.3.6
pkgrel=1
pkgdesc="A low-tech, top-down, monster-bashing maze game inspired by Gauntlet II"
arch=('i686' 'x86_64')
url="http://magicmaze.rubyforge.org/"
license=('GPL2' 'RUBY')
depends=('ruby-sdl>=1.3')
source=(http://rubyforge.org/frs/download.php/56121/$pkgname-1_4_3_6.tar.gz \
	$pkgname.sh \
	$pkgname.png \
	$pkgname.desktop)
md5sums=('e744eec0f41b23114750acc6cf54ac2d'
         'f40a95c166c8f9e3b4191d9528a2b390'
         '3584d9db7376e9a44bd18cc9d27ac7ff'
         '8fb179c8884967a9365b0d9c27e1f53f')

build() {
  mkdir -p "$pkgdir"/usr/share/{applications,pixmaps}
  cp -rf $pkgname-${pkgver//./_}/ "$pkgdir"/usr/share/$pkgname/

  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -m644 $pkgname.png "$pkgdir"/usr/share/pixmaps/
  install -m644 $pkgname.desktop "$pkgdir"/usr/share/applications/
}

# vim:set ts=2 sw=2 et:

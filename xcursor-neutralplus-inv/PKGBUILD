# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=xcursor-neutralplus-inv
pkgver=1.0
pkgrel=1
pkgdesc="White-modification of the Neutral X11 cursor theme"
arch=('any')
url="http://gnome-look.org/content/show.php/?content=94665"
license=('PerlArtistic')
depends=()
makedepends=()
source=(http://gnome-look.org/CONTENT/content-files/94665-Neutral_Plus_Inv.tar.gz)
md5sums=('7d6699a07e5dc6d24138fdd5449c70b7')

build() {
  cd Neutral_Plus_Inv

  mkdir -p "$pkgdir"/usr/share/icons/neutralplus-inv
  cp -rf index.theme cursors/ "$pkgdir"/usr/share/icons/neutralplus-inv/
}

# vim:set ts=2 sw=2 et:

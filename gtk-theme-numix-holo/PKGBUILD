# Mantainer: Diego <cdprincipe@at@gmail@dot@com>

_theme=NumixHolo
pkgname=gtk-theme-numix-holo
pkgver=0.3
pkgrel=1
pkgdesc="A flat and light theme with a modern look"
arch=('any')
url="http://xfce-look.org/content/show.php/?content=159304"
license=('GPL')
depends=('gtk-engine-murrine')
optdepends=('ttf-roboto: recomended font')

source=(http://xfce-look.org/CONTENT/content-files/159304-Numix-Holo-$pkgver.tar.gz)

package() {
  cd $srcdir/Numix\ Holo/
  install -d "$pkgdir/usr/share/themes/${_theme}"
  cp -rv * "$pkgdir/usr/share/themes/${_theme}/"
}

md5sums=('1bb73c89ee4b6ab3a734ab6448911d09')

# Mantainer: Diego <cdprincipe@at@gmail@dot@com>

_theme=NumixHolo
pkgname=gtk-theme-numix-holo-git
pkgver=9.d899d51
pkgrel=1
pkgdesc="A flat and light theme with a modern look"
arch=('any')
url="http://xfce-look.org/content/show.php/?content=159304"
license=('GPL')
depends=('gtk-engine-murrine')
makedepends=('git')
optdepends=('ttf-roboto: recomended font')
provides=('gtk-theme-numix-holo')
conflicts=('gtk-theme-numix-holo')

source=(git://github.com/duskp/numix-holo.git)
md5sums=('SKIP')


pkgver() {
  cd numix-holo
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd $srcdir/numix-holo/
  install -d "$pkgdir/usr/share/themes/${_theme}"
  cp -rv * "$pkgdir/usr/share/themes/${_theme}/"
}


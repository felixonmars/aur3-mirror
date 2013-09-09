# Maintainer: Clément DÉMOULINS <clement@archivel.fr>

pkgname=zsh-tupac
pkgver=20110403
pkgrel=2
pkgdesc="ZSH functions to tab-complete repo package names for tupac (based on zsh-yaourt)"
url="http://www.zsh.org/"
depends=('zsh')
makedepends=('zsh-yaourt')
source=()
arch=('i686' 'x86_64')
license=('GPL')
md5sums=()

package() {
  mkdir -p $pkgdir/usr/share/zsh/site-functions/
  install -m644 /usr/share/zsh/site-functions/_yaourt $pkgdir/usr/share/zsh/site-functions/_tupac
  sed -i 's/yaourt/tupac/g' $pkgdir/usr/share/zsh/site-functions/_tupac
}

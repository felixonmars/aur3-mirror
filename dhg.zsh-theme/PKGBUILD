# Maintainer: Daniel Escoz <darkhogg[at]gmail[dot]com>
_themename=dhg.zsh-theme
pkgname=$_themename
pkgver=0.5.2
pkgrel=1
pkgdesc="oh-my-zsh theme used by Daniel Escoz (Darkhogg)"
url="http://github.com/Darkhogg/$_themename"
arch=('any')
license=('GPL3')
depends=('oh-my-zsh-git')
makedepends=()
source=("$_themename")
md5sums=('636d05d569b8332d1de9bad7b92bfbad')
sha1sums=('5c7bd6111c6fb922a20e9601c952c3ff11da73c4')

package() {
  install -D -m644 "$srcdir/$_themename" "$pkgdir/usr/share/oh-my-zsh/themes/$_themename"
}

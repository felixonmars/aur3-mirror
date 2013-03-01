# Maintainer: Youpi <max.flocard@gmail.com>

pkgname=zsh-bumblebee
pkgver=2
pkgrel=1
pkgdesc="zsh completion for bumblebee with optirun AND PRIMUSRUN commands"
url="https://github.com/chmduquesne/zsh-bumblebee"
depends=(zsh)
source=('_optirun' '_primus')
arch=('any')
license=('GPL')
md5sums=('18f6c5f92c23f564daa1409dec5ce3f4'
	 '216bdc693e106275dfc52c5161239214')

package() {
  mkdir -p "$pkgdir/usr/share/zsh/site-functions/"
  install -Dm644 _optirun "$pkgdir/usr/share/zsh/site-functions/_optirun"
  install -Dm644 _primus "$pkgdir/usr/share/zsh/site-functions/_primus"
}

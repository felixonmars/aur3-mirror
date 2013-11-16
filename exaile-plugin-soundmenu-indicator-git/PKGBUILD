# Maintainer: Chionsas <aur@chionsas.lt>

pkgrel=1
pkgver=current
pkgname=exaile-plugin-soundmenu-indicator-git
pkgdesc="MPRIS2 support for Exaile music player. It enables Exaile to be controlled from Unity sound menu, Media Player extension for GNOME Shell, and other clients using MPRIS v2.1 specification."
url="https://github.com/sunng87/Exaile-Soundmenu-Indicator"
arch=('any')
license=('GPL')
depends=('exaile')
makedepends=('git')
_gitname='Exaile-Soundmenu-Indicator'
source=('git://github.com/sunng87/Exaile-Soundmenu-Indicator.git' 'install')
md5sums=('SKIP' '998dd5fb0db435e6bb68673458961c90')
install=install

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
	install -dm755 "$pkgdir/usr/share/exaile/plugins/$_gitname"
	install -m644 "$srcdir"/"$_gitname"/* "$pkgdir/usr/share/exaile/plugins/$_gitname/"
}
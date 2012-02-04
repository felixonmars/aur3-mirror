# Maintainer  sanderd17 < sanderd17 AT gmail DOT com >
pkgname=gnome-shell-theme-gnomarch-single-user
pkgver=0.95
pkgrel=1
pkgdesc="A gnome-shell theme bearing the colors of Archlinux. No system wide installation."
source=('http://www.deviantart.com/download/245249611/gnome_shell___gnomarch_by_alucryd-d420jt7.zip')
md5sums=('df8a4949b6f5f7c2cda35f31ae79eaaf')
arch=('any')
url="http://alucryd.deviantart.com/#/d420jt7"
license=('GPL')
depends=('gnome-shell')
optdepends=('gnome-shell-extension-theme-selector' 'gnome-tweak-tool')

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir$HOME/.themes"
    cp -R GnomArch "$pkgdir$HOME/.themes"
}


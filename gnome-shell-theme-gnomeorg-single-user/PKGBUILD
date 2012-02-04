# Maintainer  sanderd17 < sanderd17 AT gmail DOT com >

pkgname=gnome-shell-theme-gnomeorg-single-user
pkgver=1.1
pkgrel=1
pkgdesc="A shell theme based on the look of the gnome.org website. No system wide installation"
url="http://justviper.deviantart.com/art/gnomeorg-shell-theme-257685176"
license=('GPL')
arch=('any')
depends=('gnome-shell')
makedepends=('unzip')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
_filename="gnomeorg_shell_theme_by_justviper-d49f35k.zip"
source=("http://www.deviantart.com/download/257685176/${_filename}")
md5sums=('922c933cfcfda32c9c9c238055a493a4')

package() {
  mkdir -p "${pkgdir}$HOME/.themes/"

  unzip "${srcdir}/${_filename}" -d "${pkgdir}$HOME/.themes/"
  chmod -R 755 "${pkgdir}$HOME/.themes/Gnomeorg"
}



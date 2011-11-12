# Maintainer Nuno Araujo <nuno.araujo@russo79,com>

pkgname=gnome-shell-theme-gnomeorg
pkgver=1.2
pkgrel=1
pkgdesc="A shell theme based on the look of the gnome.org website."
url="http://justviper.deviantart.com/art/gnomeorg-shell-theme-257685176"
license=('GPL')
arch=('any')
depends=('gnome-shell')
makedepends=('unzip')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
_filename="gnomeorg_shell_theme_by_justviper-d49f35k.zip"
source=("http://www.deviantart.com/download/257685176/${_filename}")
md5sums=('7d93270c038e29ecb20a32bbadd44512')

package() {
  mkdir -p "${pkgdir}/usr/share/themes/"

  unzip "${srcdir}/${_filename}" "*.*" -x "Gnomeorg/*.*" -d "${pkgdir}/usr/share/themes/"
  chmod -R 755 "${pkgdir}/usr/share/themes/Gnomeorg (3.2)"
}



# Creator: Matthieu James <http://tiheum.deviantart.com>
# Maintainer Ahmed M. Abdellah <a3dman1@gmail.com>

pkgname=gnome-shell-theme-fainece
pkgver=1
pkgrel=1
pkgdesc="Gnome Shell theme based on Faenza."
url="http://tiheum.deviantart.com/art/Gnome-Shell-Faience-255097456"
license=('GPL3')
arch=('any')
depends=('gnome-shell')
makedepends=('unzip')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("http://www.deviantart.com/download/255097456/gnome_shell___faience_by_tiheum-d47vmgg.zip")
md5sums=('ac55f4179567fb634bd654faa5c607e9')

package() {
  mkdir -p "${pkgdir}/usr/share/themes/"

  unzip "${srcdir}/gnome_shell___faience_by_tiheum-d47vmgg.zip" -d "${pkgdir}/usr/share/themes/"
  chmod -R 755 "${pkgdir}/usr/share/themes/Faience"
}



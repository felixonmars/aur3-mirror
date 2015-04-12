# Maintainer: Alexis Diavatis <alexis.diavatis@gmail.com>


pkgname=evopop-shell-theme-git
pkgver="0.1.x"
pkgrel=3
pkgdesc='Gnome Shell theme to match Evopop Gtk and icons'
arch=('any')
url='https://github.com/alex285/evopop-shell-dist'
license=('GPL3')
makedepends=('git')
provides=('evopop-gnome-shell')
conflicts=('evopop-gnome-shell')
source=('evopop-gnome-shell::git+https://github.com/alex285/evopop-shell-dist.git')
md5sums=('SKIP')

#pkgver() {
#  cd evopop-gnome-shell
#  cat package.json | jq '.version'
#}

package() {
  cd evopop-gnome-shell
  install -dm 755 "${pkgdir}"/usr/share/themes/Evopop-Shell
  rm -rf .git .gitignore LICENSE README.md
  cp -dr --no-preserve='ownership' * "${pkgdir}"/usr/share/themes/Evopop-Shell/
}



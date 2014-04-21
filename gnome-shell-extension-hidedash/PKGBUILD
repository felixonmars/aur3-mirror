# Maintainer: xenatt <exenatt at gmail dot com>
# Contributor: xenatt  <exenatt at gmail dot com>

pkgname=gnome-shell-extension-hidedash
pkgver=20140420
pkgrel=1
pkgdesc="gnome-shell-extension-hide-dash is a simple extension that hides the dash from the activities overview. only support gnome-shell 3.10 , 3.12"
url="https://github.com/xenatt/gnome-shell-extension-hide-dash"
arch=('any')
license=('GPL')
source=("https://github.com/xenatt/gnome-shell-extension-hide-dash/archive/master.zip")
sha1sums=('SKIP')

package() {
  cd "${srcdir}"
  cd gnome-shell-extension-hide-dash-master
  mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/"
  cp -r 'hide-dash@xenatt.github.com' "${pkgdir}/usr/share/gnome-shell/extensions/"
  find "${pkgdir}/usr/share/gnome-shell/extensions/" -type d -exec chmod 755 '{}' \;
  find "${pkgdir}/usr/share/gnome-shell/extensions/" -type f -exec chmod 755 '{}' \;
}


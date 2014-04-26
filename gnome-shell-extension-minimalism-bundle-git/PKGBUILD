# Maintainer: xenatt <exenatt at gmail dot com>
# Contributor: xenatt  <exenatt at gmail dot com>

pkgname=gnome-shell-extension-minimalism-bundle-git
pkgver=20140425
pkgrel=1
pkgdesc="gnome shell extension minimalism bundle is gnome shell extension sets for minimal desktop in project Minimalism Gnome Shell , Now Hide Workspace Overview Thumbnails , Hide Dash X , Launch And Expose"
url="https://github.com/xenatt/Minimalism-Gnome-Shell/"
arch=('any')
license=('GPL')
source=("https://github.com/xenatt/Minimalism-Gnome-Shell/archive/master.zip")
sha1sums=('SKIP')

package() {
  cd "${srcdir}"
  cd Minimalism-Gnome-Shell-master
  mkdir -p "${pkgdir}/usr/share/applications/"
  mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/"
  cp -r 'Launch-And-Expose@xenatt.github.com' "${pkgdir}/usr/share/gnome-shell/extensions/"
  cp -r 'hide-dash@xenatt.github.com' "${pkgdir}/usr/share/gnome-shell/extensions/"
  cp -r 'hide-workspace@xenatt.github.com' "${pkgdir}/usr/share/gnome-shell/extensions/"
  cp -r 'LaunchPad.desktop' "${pkgdir}/usr/share/applications/"
  find "${pkgdir}/usr/share/gnome-shell/extensions/" -type d -exec chmod 755 '{}' \;
  find "${pkgdir}/usr/share/gnome-shell/extensions/" -type f -exec chmod 644 '{}' \;
  find "${pkgdir}/usr/share/applications/" -type d -exec chmod 755 '{}' \;
  find "${pkgdir}/usr/share/applications/" -type f -exec chmod 644 '{}' \;
}


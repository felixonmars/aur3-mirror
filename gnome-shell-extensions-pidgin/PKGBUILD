# Maintainer: Ebenezer Edelman <contact@EbenezerEdelman.tk>

pkgname=gnome-shell-extensions-pidgin
pkgver=0.1.1
pkgrel=4
pkgdesc="Pidgin integration for Gnome Shell (deprecated)."
arch=(any)
url="https://github.com/kagesenshi/gnome-shell-extensions-pidgin"
license=(unknown)
depends=('pidgin' 'gnome-shell=3.2')
optdepends=('gnome-tweak-tool')
source=('extension.js' 'metadata.json')
md5sums=('1b828d958dce74a8ca42f54a88bf17ff'
         '7cfa2bc37e846bafca87f7d7a429d2d0')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/pidgin@gnome-shell-extensions.gnome.org"
  cp extension.js "$pkgdir/usr/share/gnome-shell/extensions/pidgin@gnome-shell-extensions.gnome.org/"
  cp metadata.json "$pkgdir/usr/share/gnome-shell/extensions/pidgin@gnome-shell-extensions.gnome.org/"
}

# vim:set ts=2 sw=2 et:

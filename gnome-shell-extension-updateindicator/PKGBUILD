# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=gnome-shell-extension-updateindicator
pkgver=0~12
pkgrel=1
pkgdesc="An indicator that displays pending updates."
arch=(any)
url="http://launchpad.net/updateindicator"
license=(GPL)
depends=('gnome-shell>=3.2' 'packagekit')
optdepends=('gnome-tweak-tool: to manage activated extensions')
install=${pkgname}.install
changelog=Changelog
source=("http://ppa.launchpad.net/aegirxx-googlemail/gnome-shell-extensions/ubuntu/pool/main/g/${pkgname}/${pkgname}_${pkgver}ubuntu1.tar.gz")
md5sums=('72f36495127324355a587d548e847747')

package() {
  cd "${srcdir}/UpdateIndicator/extension"

  msg2 "Install extension in /usr/share/gnome-shell/extensions..."
  install -dm755 "${pkgdir}/usr/share/gnome-shell/extensions/updateindicator@aegirxx.googlemail.com/"
  install -m644 stylesheet.css metadata.json extension.js "${pkgdir}/usr/share/gnome-shell/extensions/updateindicator@aegirxx.googlemail.com/"

  msg2 "Install schema in /usr/share/glib-2.0/schemas"
  install -dm755 "${pkgdir}/usr/share/glib-2.0/schemas/"
  install -m644 org.gnome.shell.extensions.updateindicator.gschema.xml "${pkgdir}/usr/share/glib-2.0/schemas/"
}

# vim:set ts=2 sw=2 et:

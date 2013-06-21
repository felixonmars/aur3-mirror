#Maintainer: jsh <jsh at myreseau dot org>

pkgname=gnome-shell-extension-status-area-horizontal-spacing
pkgver=3.8
pkgrel=1
pkgdesc="Permits to reduce the horizontal spacing between status area icons"
arch=('any')
url="https://bitbucket.org/mathematicalcoffee/status-area-horizontal-spacing-gnome-shell-extension"
license=('Unknown')
depends=('gnome-shell')
groups=('gnome-shell-extensions')
install=status-area-horizontal-spacing.install
source=("https://bitbucket.org/mathematicalcoffee/status-area-horizontal-spacing-gnome-shell-extension/downloads/gnome${pkgver}_status-area-horizontal-spacing@mathematical.coffee.gmail.com.zip")
sha256sums=('417ba276ff4598802ccc9c18a8d7f4008899005fa732433e0de9925900931965')

package() {
  uuid='status-area-horizontal-spacing@mathematical.coffee.gmail.com'
  cd "${srcdir}"

  install -Dm644 "${uuid}/metadata.json" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/metadata.json"
  install -m644 "${uuid}/extension.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/extension.js"
  install -m644 "${uuid}/convenience.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/convenience.js"
  install -m644 "${uuid}/prefs.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/prefs.js"

  install -Dm644 "${uuid}/schemas/org.gnome.shell.extensions.status-area-horizontal-spacing.gschema.xml" \
      "${pkgdir}/usr/share/glib-2.0/schemas/org.gnome.shell.extensions.status-area-horizontal-spacing.gschema.xml"
}

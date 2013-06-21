#Maintainer: jsh <jsh at myreseau dot org>

pkgname=gnome-shell-extension-maximus
pkgver=20130621
pkgrel=1
pkgdesc="Removes decoration (i.e. the title bar) from maximised windows, saving vertical real estate."
arch=('any')
url="https://bitbucket.org/mathematicalcoffee/maximus-gnome-shell-extension"
license=('Unknown')
depends=('gnome-shell')
makedepends=('mercurial')
#source="https://bitbucket.org/mathematicalcoffee/maximus-gnome-shell-extension/downloads/gnome${pkgver}_maximus@mathematical.coffee.gmail.com.zip"
groups=('gnome-shell-extensions')
#sha256sums='395b0f5be62b75a963c158c7b590a84ee497b7d7ccbc52d6784f179eef632be6'
install=maximus.install

_hgroot="https://bitbucket.org/mathematicalcoffee/maximus-gnome-shell-extension"
_hgname="maximus"

build() {
    cd "${srcdir}"
    msg "Connecting to Mercurial server...."

    if [ -d $_hgname ] ; then
        cd $_hgname && hg pull # && hg up gnome3.4
        msg "The local files are updated."
    else
        hg clone $_hgroot $_hgname # && cd $_hgname && hg up gnome3.4
    fi

    msg "Mercurial checkout done or server timeout"
}

package() {
  uuid='maximus@mathematical.coffee.gmail.com'

  cd "${srcdir}/${_hgname}"

  install -Dm644 "${uuid}/metadata.json" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/metadata.json"
  install -m644 "${uuid}/extension.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/extension.js"
  install -m644 "${uuid}/convenience.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/convenience.js"
  install -m644 "${uuid}/prefs.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/prefs.js"
  install -m644 "${uuid}/appChooserDialog.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/appChooserDialog.js"

  install -Dm644 "${uuid}/schemas/org.gnome.shell.extensions.maximus.gschema.xml" \
      "${pkgdir}/usr/share/glib-2.0/schemas/org.gnome.shell.extensions.maximus.gschema.xml"
}

# Maintainer: Cloud Han <heliumhgy@gmail.com>
pkgname=emacs-client-accessories
pkgver=2
pkgrel=1
pkgdesc="Accessories for emacs to start a client, including an application item, a /bin srcipt and a systemd service"
arch=('any')
url="https://aur.archlinux.org"
license=('None')
groups=()
depends=('emacs' 'systemd')
makedepends=()
optdepends=()
provides=('emacs-client-accessories')
conflicts=()
replaces=()
backup=()
options=()
install='accessories.install'
changelog=
source=('emacsclient.desktop'
	'ec'
	'emacs@.service'
        'accessories.install')
md5sums=('e99818832ad16e240aecb6c29ce6d42b'
         '1e108e38ccbc35645e90015d0d3ebed3'
         '82192f83a3422844c81a4dbe54f1ef99'
         'e0531b6adef5f46bcbf1c652cdcbd109')
noextract=()

package() {
  install -Dm 644 "${startdir}/emacsclient.desktop" "${pkgdir}/usr/share/applications/emacsclient.desktop"
  install -Dm 755 "${startdir}/ec" "${pkgdir}/usr/bin/ec"
  install -Dm 644 "${startdir}/emacs@.service" "${pkgdir}/etc/systemd/system/emacs@.service"
}

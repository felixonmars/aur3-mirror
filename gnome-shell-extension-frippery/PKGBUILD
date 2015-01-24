# Maintainer: aboe <aboe76 at gmail dot com>

pkgname="gnome-shell-extension-frippery"
_pkgname="gnome-shell-frippery"
pkgdesc="GNOME Shell extensions for GNOME 2 user experience"
pkgver=0.9.0
pkgrel=1
url="http://intgat.tigress.co.uk/rmy/extensions/index.html"
license=(GPLv2)
depends=('gnome-shell>=3.14')
source=("http://intgat.tigress.co.uk/rmy/extensions/${_pkgname}-${pkgver}.tgz")
md5sums=('33252687a7b66d6faf1b0e923ce16d92')
arch=('any')


package() {
  destdir="${pkgdir}/usr/share/gnome-shell/"
  docdir="${pkgdir}/usr/share/doc"
  mkdir -p ${destdir}
  mkdir -p ${docdir}
  cp -rp ${srcdir}/.local/share/gnome-shell/extensions "${destdir}"
  cp -rp ${srcdir}/.local/share/gnome-shell/${_pkgname} "${docdir}/${_pkgname}-${pkgver}"
}


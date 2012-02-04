# -*- shell-script -*-
#
# Contributor: Adrian C. <anrxc.sysphere.org>

pkgname=emacs-epg
_realname=easypg
pkgver=0.0.16
pkgrel=3
pkgdesc="EasyPG is a GnuPG interface for GNU Emacs"
arch=("i686" "x86_64")
url="http://www.easypg.org/"
license=("GPL2")
depends=("emacs" "gnupg")
makedepends=("make" "emacs")
install="${pkgname}.install"
source=("http://ftp.de.debian.org/debian/pool/main/e/${_realname}/${_realname}_${pkgver}.orig.tar.gz")
md5sums=("27a0e4fae318ed855f807bc3bec926e5")


build() {
  cd "${srcdir}/${pkgname:6:3}-${pkgver}"

# Build easypg
  ./configure --prefix=/usr || return 1
  make || return 1

# Install easypg
  install -d "${pkgdir}/usr/share/emacs/site-lisp/epg/" || return 1
  install -m644 *.el* "${pkgdir}/usr/share/emacs/site-lisp/epg" || return 1

# Install documentation
  install -d "${pkgdir}/usr/share/info/" || return 1
  install -m644 epa.info "${pkgdir}/usr/share/info" || return 1
}

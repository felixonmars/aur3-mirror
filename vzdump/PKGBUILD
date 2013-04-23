# Maintainer:   Lucky <archlinux@builds.lucky.li>
# Contributor:  Michal Karas <largon@largon.net>

pkgname=vzdump
pkgver=20110913
_pkgver="${pkgver:0:4}-${pkgver:4:2}-${pkgver:6:2}"
pkgrel=2
pkgdesc="OpenVZ container consistent snapshot utility"
url="http://download.openvz.org/contrib/utils/vzdump/"
license=("GPL")
arch=("i686" "x86_64")
depends=("cstream" "lvm2" "perl-lockfile-simple" "vzctl")
optdepends=("smtp-server: for sending mail notifications")
source=("http://download.proxmox.com/sources/${pkgname}_${_pkgver}.tar.gz")
md5sums=("efed9fc7b6851cbd4537627bc8c715b0")

build() {
  cd "${srcdir}/${pkgname}_${_pkgver}"

  make dist
}

package() {
  cd "${srcdir}/${pkgname}_${_pkgver}"

  make DESTDIR="${pkgdir}" \
    SBINDIR="/usr/bin" \
    PERLLIBDIR="/usr/share/perl5/vendor_perl/PVE/" \
    install
}

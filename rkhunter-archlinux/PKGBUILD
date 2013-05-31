# $Id: PKGBUILD 70436 2012-05-06 13:53:34Z lfleischer $
# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=rkhunter-archlinux
_pkgname=rkhunter
pkgver=1.4.0
pkgrel=1
pkgdesc='rootkits checker with ArchLinux specific patches.'
arch=('any')
url='http://rkhunter.sourceforge.net/'
license=('GPL')
depends=('bash' 'perl' 'wget')
optdepends=('unhide')
backup=('etc/rkhunter.conf')
conflicts=('rkhunter')
provides=('rkhunter')
source=("http://downloads.sourceforge.net/sourceforge/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"{,.asc}
        rkhunter_systemd_journal.patch
        rkhunter_remove_ifconfig.patch)
md5sums=('37b1ceb79a5ff3debca335d6550ac6b0'
         'e83221c3eb3f417357059731c809a9de'
         'f7304c0e50ff1e124d7aca429cff29b7'
         '50354515251ad11780f37193a10dbb6a')

package() {
  cd "${_pkgname}-${pkgver}"

  patch -p1 -i "${srcdir}/rkhunter_systemd_journal.patch"
  patch -p1 -i "${srcdir}/rkhunter_remove_ifconfig.patch"

  # fix installer for x86_64
  sed -i -e "s/lib64/lib/g" installer.sh

  # install to "/usr"
  install -dm0755 "${pkgdir}/usr"
  ./installer.sh --layout custom "${pkgdir}/usr" --striproot "${pkgdir}" --install

  # fix paths
  mv "${pkgdir}/usr/etc" "${pkgdir}"
  mv "${pkgdir}/usr/var" "${pkgdir}"

  sed -i -e "s#/usr/etc/rkhunter.conf#/etc/rkhunter.conf#g" "${pkgdir}/usr/bin/${_pkgname}"
  sed -i -e "s#/usr/etc/rkhunter.conf#/etc/rkhunter.conf#g" "${pkgdir}/etc/${_pkgname}.conf"
  sed -i -e "s#/usr/var/lib/rkhunter/db#/var/lib/rkhunter/db#g" "${pkgdir}/etc/${_pkgname}.conf"
  sed -i -e "s#/usr/var/lib/rkhunter/tmp#/var/lib/rkhunter/tmp#g" "${pkgdir}/etc/${_pkgname}.conf"

  # cleanup
  rm -f "${pkgdir}/var/lib/${_pkgname}/tmp/"{group,passwd}

  # we trust in udev
  sed -i 's|^#ALLOWHIDDENDIR=/dev/.udev$|ALLOWHIDDENDIR=/dev/.udev|' \
    "${pkgdir}/etc/${_pkgname}.conf"
}

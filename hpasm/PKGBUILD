# Contributor: Trevor Turner <turn3r [dot] tr3v0r [at] gmail [dot] com>
_i686rpm=hpasm-7.7.0-115.sles9.i586.rpm
_x86_64rpm=hpasm-7.7.0-115.sles9.x86_64.rpm
pkgname=hpasm
pkgver=7.7.0.115
pkgrel=2
pkgdesc="HP Proliant Server Management Agents and Utilities"
arch=('i686' 'x86_64')
url="ftp://ftp.compaq.com/pub/products/servers/supportsoftware/linux/"
license=('custom')
makedepends=('rpmextract')
source=('hpasmd' 'hpasmd.service')
md5sums=('4efbcaf99d2ad688d5887dd28d48854f' '3249472c2ca273d8c348b8daf0ffd996')

if [ "${CARCH}" = "x86_64" ]; then
  source+=(ftp://ftp.compaq.com/pub/products/servers/supportsoftware/linux/${_x86_64rpm})
  md5sums+=('812416e7ee25690d55389b1df1b549bb')
  noextract=("${_x86_64rpm}")
elif [ "${CARCH}" = "i686" ]; then
  source+=(ftp://ftp.compaq.com/pub/products/servers/supportsoftware/linux/${_i686rpm})
  md5sums+=('420e886d6a66eb6cb3fd0671635519ec')
  noextract=("${_i686rpm}")
fi

package() {
  cd "$srcdir"
  msg2 "Extracting RPM..."
  rpmextract.sh *.rpm
  msg2 "Installing Files..."
  cp -r "${srcdir}/opt" "${pkgdir}/"
  chmod 755 -R "${pkgdir}/opt"
  install -Dm 755 "${srcdir}/hpasmd" "${pkgdir}/etc/rc.d/hpasmd"
  install -Dm 755 "${srcdir}/hpasmd.service" "${pkgdir}/usr/lib/systemd/system/hpasmd.service"
  install -dm 755 "${pkgdir}/usr/sbin"
  ln -s "/opt/compaq/utils/bootcfg" "${pkgdir}/usr/sbin/bootcfg"
  ln -s "/opt/compaq/utils/hpasmcli" "${pkgdir}/usr/sbin/hpasmcli"
  ln -s "/opt/compaq/utils/hplog" "${pkgdir}/usr/sbin/hplog"
  ln -s "/opt/compaq/utils/hpuid" "${pkgdir}/usr/sbin/hpuid"
  ln -s "/opt/compaq/hpasmd/bin/hpasmd" "${pkgdir}/usr/sbin/hpasmd"
  ln -s "/opt/compaq/hpasm/addon/libhpasmintrfc.so.1.0" "${pkgdir}/usr/lib/libhpasmintrfc.so.1.0"
  ln -s "libhpasmintrfc.so.1.0" "${pkgdir}/usr/lib/libhpasmintrfc.so.1"
  ln -s "/opt/compaq/hpasm/addon/libhpev.so.1.0" "${pkgdir}/usr/lib/libhpev.so.1.0"
  ln -s "libhpev.so.1.0" "${pkgdir}/usr/lib/libhpev.so.1"
}
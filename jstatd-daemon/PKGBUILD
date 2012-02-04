# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=jstatd-daemon
_daemon=jstatd
pkgver=1.0.0
pkgrel=1
pkgdesc="A configurable rc.d daemon for jstatd."
arch=(any)
url="https://github.com/nicoulaj/archlinux-packages/tree/master/jstatd-daemon"
license=(BSD)
depends=(java-environment bash)
changelog=Changelog
backup=("etc/conf.d/${_daemon}")
source=("${_daemon}.conf.d"
        "${_daemon}.rc.d"
        "${_daemon}.all.policy")
md5sums=('28c64a060dab2a489058e529e2ac6335'
         '6983693eceefa805409cb8253d179363'
         '4da21ee2ff5a58127b3f5b06d5476ba7')

package() {
  msg2 "Install daemon script in /etc/rc.d..."
  install -Dm755 "${srcdir}/${_daemon}.rc.d" "${pkgdir}/etc/rc.d/${_daemon}"

  msg2 "Install daemon conf file in /etc/conf.d..."
  install -Dm644 "${srcdir}/${_daemon}.conf.d" "${pkgdir}/etc/conf.d/${_daemon}"

  msg2 "Install daemon policy files in /etc/jstatd..."
  install -Dm644 "${srcdir}/${_daemon}.all.policy" "${pkgdir}/etc/jstatd/all.policy"
}

# Maintainer: Felix Yan <felixonmars@gmail.com>

_pkgbase=incron
_pkgdaemon=incrond
pkgname=systemd-${_pkgbase}-units
pkgver=1
pkgrel=0
pkgdesc="Inotify System Scheduler service for systemd"
arch=('any')
url="http://www.freedesktop.org/wiki/Software/systemd"
license=('GPL')
depends=("${_pkgbase}" 'systemd')
source=("${_pkgdaemon}.service")
md5sums=('859a90af9e4efe40db381ea07167a66a')

package() {
  install -Dm644 "${srcdir}/${_pkgdaemon}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgdaemon}.service"
}

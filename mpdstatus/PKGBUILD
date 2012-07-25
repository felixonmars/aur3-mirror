# Maintainer: Mathieu (matael) Gaborit <mat.gaborit@gmx.com>
pkgname=mpdstatus
pkgver=1.0
pkgrel=1
pkgdesc="A simple script to echo mpd's state and now playing song"
arch=(any)
url="http://projects.bleah.co.uk/misc/wiki/MpdStatus"
license=('GPL')
depends=('python2' 'python-mpdclient2' 'mpd')
provides=('mpd-status')
source=(mpdstatus.py)
md5sums=('3de44ab5aecda8f6e19a07ed52116c90')

build() {
  install -Dm755 "${srcdir}/mpdstatus.py" "${pkgdir}/usr/bin/${pkgname}" || return 1
}

# vim:set ts=2 sw=2 et:

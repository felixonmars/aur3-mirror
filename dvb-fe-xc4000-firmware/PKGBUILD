# Maintainer: Tasos Latsas <tlatsas@gmx.com>
pkgname=dvb-fe-xc4000-firmware
_name=xc4000
pkgver=1.4
pkgrel=1
pkgdesc="Firmware file for xc4000 tuner"
arch=(any)
url="http://istvanv.users.sourceforge.net/v4l/xc4000.html"
license=('Custom')
options=(!strip)
source=("http://istvanv.users.sourceforge.net/v4l/$_name-$pkgver.fw")

package() {
  cd "$srcdir"

  install -d $pkgdir/usr/lib/firmware
  install -m644 $_name-$pkgver.fw $pkgdir/usr/lib/firmware
  ln -s /usr/lib/firmware/$_name-$pkgver.fw $pkgdir/usr/lib/firmware/dvb-fe-xc4000-1.4.fw
}

sha256sums=('26103fb9a127c5eec01230b8db140036c6449ecb6d5a76c7bd575439441afa34')

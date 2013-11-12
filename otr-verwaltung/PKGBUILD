# Maintainer: boenki <boenki at gmx dot de>
# Contributor: Max Roder <maxroder@web.de>
# Contributor: soeren <nonick@posteo.de>

pkgname='otr-verwaltung'
pkgver='0.9.1'
pkgrel='5'
pkgdesc='Manage your onlinetvrecorder.com files: cut, preview cuts, rate cutlists etc.'
arch=('any')
url='http://elbersb.de/otrverwaltung'
license=('GPL3')
depends=('python2-dbus' 'python2-xdg' 'python2-simplejson' 'pygtk' 'mplayer' 'avidemux-cli' 'aria2' 'wget')
optdepends=('avidemux-gtk' 'wine' 'otrdecoder>=0.4.1132')
makedepends=('python2-distutils-extra')
source=("${pkgname}-${pkgver}.tar.gz::http://github.com/elbersb/$pkgname/tarball/$pkgver")
md5sums=('38f521d2520a3d93ca2da033135ea106')

package() {
  cd elbersb-$pkgname-3a55130
  python2 setup.py install --root=${pkgdir} --optimize=1
  msg "If you want to cut any HQ files, you'll need to install VirtualDub and ffdshow with wine."
}
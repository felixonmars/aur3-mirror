# Maintainer: Jameson Pugh <imntreal@gmail.com>

_pkgname=miro
pkgname=$_pkgname-mirobridge
pkgver=4.0.6
pkgrel=1
pkgdesc="The free and open source internet TV platform, without gnome"
arch=('i686' 'x86_64')
url="http://www.getmiro.com"
license=('GPL2')
depends=('libsoup' 'dbus-python' 'python2-cairo' 'pywebkitgtk' 'python2-gconf'
'gstreamer0.10-base-plugins' 'gstreamer0.10-good-plugins' 'gstreamer0.10-python'
'libtorrent-rasterbar' 'python-pycurl' 'ffmpeg' 'desktop-file-utils' 'mutagen')
makedepends=('pyrex')
conflicts=('miro')
provides=('miro')
install=miro.install
source=(http://ftp.osuosl.org/pub/pculture.org/${_pkgname}/src/${_pkgname}-${pkgver}.tar.gz
	'ffmpeg.patch')
sha1sums=('5c3d632d8cf30516b321f79b22d4468b61ff9e6c'
	'ce0f42be2a0a3ac99f07b5abfabf0975928c841c')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/linux"

  patch -p2 -i "${srcdir}"/ffmpeg.patch

  python2 setup.py install --root=${pkgdir} || return 1

  # fix miro startup script so --debug works with python2
  sed -i "s|which python|which python2|" ${pkgdir}/usr/bin/miro || return 1
  sed -i "s|./miro.real|/usr/bin/miro.real|" ${pkgdir}/usr/bin/miro || return 1
}

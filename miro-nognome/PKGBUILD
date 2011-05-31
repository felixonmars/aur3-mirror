# Maintainer: Oliver Sherouse <firstname.lastname@gmail.com>

_pkgname=miro
pkgname=$_pkgname-nognome
pkgver=4.0
pkgrel=2
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
source=(http://ftp.osuosl.org/pub/pculture.org/${_pkgname}/src/${_pkgname}-${pkgver}.tar.gz)
sha1sums=('fdd2b2d375499c97a1caf6db2272bfa687c08cf7')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/linux"

  python2 setup.py install --root=${pkgdir} || return 1

  # fix miro startup script so --debug works with python2
  sed -i "s|which python|which python2|" ${pkgdir}/usr/bin/miro || return 1
  sed -i "s|./miro.real|/usr/bin/miro.real|" ${pkgdir}/usr/bin/miro || return 1
}

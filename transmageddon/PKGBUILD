# Maintainer: Dan Serban
# Contributor: Federico Chiacchiaretta

pkgname=transmageddon
pkgver=0.20
pkgrel=1
pkgdesc="A video transcoder that is built using GStreamer"
arch=(i686 x86_64)
url=http://www.linuxrising.org/
license=(GPL)
depends=(gstreamer0.10-python librsvg pygobject pygtk)
makedepends=(intltool)
optdepends=('gstreamer0.10-plugins: additional codecs')
source=("http://www.linuxrising.org/files/transmageddon-${pkgver}.tar.bz2")
md5sums=('ce1cdc366d10c8b3bcc7b73afb08b627')

build()
{
  cd transmageddon-${pkgver}
  sed -i 's/python transmageddon.py/python2 transmageddon.py/' bin/transmageddon.in
  ./configure --prefix=/usr --sysconfdir=/etc --localedir=/usr/share/locale
  make
  make DESTDIR="${pkgdir}" install
}


# Contributor: Ronny Steiner <post@sirsteiner.de>
# Maintainer: Thomas Kopp <20.kopp@googlemail.com>
# AUR Category: office
pkgname=ffgtk-svn
pkgver=1817
pkgrel=2
pkgdesc="FRITZ!Box Fax-Software and Call-Monitor (SVN-Version)"
url="http://www.tabos.org/ffgtk"
license="GPL"
depends=('libcapi20' 'spandsp')
makedepends=('libcapi20' 'spandsp' 'intltool' 'libao' 'speex' 'libsndfile')
conflicts=('ffgtk')
arch=(i686 x86_64)
source=()
md5sums=()
install="ffgtk.install"

build() {
  cd ${srcdir}
  svn co http://svn.tabos.org/repos/ffgtk/trunk ./${pkgname}
  cd ${srcdir}/${pkgname}
  mkdir -p m4
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --with-gnome-keyring=no --disable-Werror
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}

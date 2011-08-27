# Maintainer: Chuck Atkins <chuckatkins at gmail dot com>
# Contributors: Andrew Antle <andrew dot antle at gmail dot com>

pkgname=gst-editor0.10
pkgver=0.10.3.1
pkgrel=1
pkgdesc="A graphical pileline eeditor for the GStreamer multimedia framework"
arch=(i686 x86_64)
license=(LGPL)
url="http://code.google.com/p/gst-editor/"
groups=('multimedia')
makedepends=('intltool')
depends=('gstreamer0.10>=0.10' 'goocanvas' )
replaces=('gst-editor-0.10')
source=(http://gst-editor.googlecode.com/files/gsteditor-${pkgver}.tar.gz)
md5sums=('bc33fe33a3e78a919243ebab53bd87d1')
sha1sums=('e7d8d0bf9e6fabd2b416886afb60cece6f490769')
sha256sums=('63ee22ccdc71b92657c9121d91436123fca767244780fe65f3ab3f08788f0b5a')
sha384sums=('34678e32d57208fa7bb74172932b831e459aea61b723da4d97a87e38caf7e61961c111c31d305da1bdc21bf3eff44625')
sha512sums=('2852cee6eeca4f7c9486ebc8c5e80eab8161f9e293370c81c9fd1923ad86b7ab2a3b5481a324ce7003ada9dff272e3819f56d93d109f9d25df069bede6877c30')

build() {
  cd ${srcdir}/gsteditor-${pkgver}
  ./configure --prefix=/usr
  make
  make DESTDIR="${pkgdir}" install 
  grep -R "$srcdir" $pkgdir
}


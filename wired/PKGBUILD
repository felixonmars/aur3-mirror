# Contributor: Ray Rashif <schivmeister@gmail.com>
# Previous/other contributor(s): Prashant Vaibhav, Johannes Sjolund

pkgname=wired
pkgver=0.7.0
pkgrel=1
pkgdesc="Modern semi-professional Digital Audio Workstation"
url="http://sourceforge.net/projects/wired/"
arch=('i686' 'x86_64')
license=('GPL2')
options=('!libtool')
depends=('wxgtk' 'dssi' 'soundtouch' 'libxml2' 'libsndfile') #'portaudio'
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/${pkgname}-$pkgver.tar.gz
        $pkgname.desktop)
md5sums=('8422c78b0e6e2921845fdf4aadf5ecf9'
         '3fc207496ee5c65f656331319df07477')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr \
  		--sysconfdir=/etc \
		--enable-gtk2 \
  		--disable-portaudio \
		--disable-codecs 	# to get rid of libflac++

  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install

  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}

# Maintainer: Sarkasper <echo a2FzcGVyLm1lbnRlbkBnbXguY29tCg== | base64 -d>
# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>

pkgname=lives-stable
pkgver=1.3.12
pkgrel=1
pkgdesc="A Video Editing System"
arch=('i686' 'x86_64')
url="http://lives.sourceforge.net/"
license=('GPL')
depends=('mplayer' 'imagemagick' 'perl' 'gtk2' 'libjpeg6-turbo' 'gdk-pixbuf2' 'sox' 'transcode' 'mencoder' 'mjpegtools')
optdepends=('xmms' 'cdda2wav')
makedepends=('gettext' 'imake')
conflicts=('lives')
provides=('lives')
options=(!libtool)
source=(http://www.xs4all.nl/%7Esalsaman/lives/current/LiVES-$pkgver.tar.bz2)
md5sums=('eaa61aa4a223ab4a622c6571f0d748bf')

build() {
  cd $srcdir/lives-$pkgver

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install

  rm $pkgdir/usr/bin/lives
  ln -s /usr/bin/lives-exe $pkgdir/usr/bin/lives
}

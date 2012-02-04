# Maintainer: Heiko Baums <heiko@baums-on-web.de>

pkgname=qdvdauthor
pkgver=2.3.0
pkgrel=1
pkgdesc="'Q' DVD-Author is a Qt-based DVD authoring suite"
url="http://qdvdauthor.sourceforge.net"
license=('GPL')
arch=('i686' 'x86_64')
depends=('dvdauthor' 'imagemagick' 'mjpegtools' 'dvd-slideshow' 'jhead' 'ffmpeg' 'xine-lib' 'mplayer' 'qt' 'qt3' 'netpbm' 'videotrans' 'toolame' 'lame' 'sox')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('5b5d374d4d794f18b4bac386f807f0be')

build() {
  cd $srcdir/$pkgname-$pkgver

  export STATIC_FFMPEG=1

  # Set our C(XX)FLAGS
  for PRO in */*.pro */*/*.pro; do
    echo "QMAKE_CFLAGS_RELEASE = ${CFLAGS}" >> "${PRO}"
    echo "QMAKE_CXXFLAGS_RELEASE = ${CXXFLAGS}" >> "${PRO}"
  done

  # Have qrender look for ffmpeg in /usr instead of /usr/local
  cd $srcdir/$pkgname-$pkgver/qrender
  sed -i "s:\/local::g" qrender.pro

  # Build qdvdauthor
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=$pkgdir/usr --system-path=/usr --no-configurator --omit-local-ffmpeg || return 1
  ./configure --no-configurator --install

  # Install menu entry
  cd $srcdir/$pkgname-$pkgver
  install -D -m644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -D -m644 $pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}

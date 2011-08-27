# Contributor: Gabor Nyekhelyi (n0gabor) <n0gabor@vipmail.hu>

pkgname=gv4l
pkgver=2.2.4
pkgrel=1
pkgdesc="Gv4l is a GUI frontend for the V4L (Video For Linux) functions of transcode, used to record video (and audio) streams from a V4L devices, such as tuners and webcams, in encoded or raw video formats"
depends=('libgnomeui' 'gtk2' 'xawtv' 'transcode')
source=(http://dl.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
url="http://gv4l.sourceforge.net"
md5sums=('b5692b64f78948d187e1a024f68c6d7f')
install=gv4l.install

build() {
   cd $startdir/src/$pkgname-$pkgver
   ./configure --prefix=/usr
   make || return 1
   make DESTDIR=$startdir/pkg install
}


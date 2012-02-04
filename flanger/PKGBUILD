# Maintainer: Ori Lahav <vbCrLf ta GMail tod com>
pkgname=flanger
pkgver=0.1.2
pkgrel=1
pkgdesc="Intuitive flow-chart style sound editing for Linux, Windows and Mac."
arch=('i686' 'x86_64')
url="http://sourceforge.net/p/flanger/"
license=('GPL')
install=flanger.install
depends=('qt' 'portaudio' 'libsndfile' 'libsamplerate')
source=(http://downloads.sourceforge.net/project/flanger/flanger_$pkgver.src.tar.gz)
md5sums=('9e37865097fff36d4ff38dd65c3fd497')

build() {
    cd flanger
    qmake && make
}

package() {
	install -dm755 $pkgdir/usr/{bin,share/flanger/examples,share/applications/}
    install -m755 $srcdir/flanger/Flanger $pkgdir/usr/bin/flanger
    install -m644 $srcdir/flanger/other/flanger.desktop $pkgdir/usr/share/applications/
    
    # There are some examples which aren't working, copy only one
    # install -m644 $srcdir/flanger/files/* $pkgdir/usr/share/flanger/examples/
    install -m644 $srcdir/flanger/files/exp_example.flanger $pkgdir/usr/share/flanger/examples/exp_example.flanger
}

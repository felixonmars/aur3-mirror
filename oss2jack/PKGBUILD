# Contributor: nut543 <kfs1@online.no>
pkgname=oss2jack
pkgver=0.25
arch=('i686')
pkgrel=7
pkgdesc="Routes /dev/dsp to Jack enabling TeamSpeak and other OSS-only mmap apps to work."
depends=(jack-audio-connection-kit libsamplerate fusd-kor)
source=(http://fort.xdas.com/~kor/oss2jack/$pkgname-$pkgver.tar.gz \
oss2jack)
url="http://fort.xdas.com/~kor/oss2jack/"
license=('GPL')
md5sums=(7fd10dd2391cbef147fa36563969e3e2\
 596661877446a02c7e9497178db60af7)
install=oss2jack.install
build() {
mkdir -p $startdir/pkg/etc/rc.d
install -g root -o root -m 755 $startdir/oss2jack $startdir/pkg/etc/rc.d/oss2jack
cd $startdir/src/$pkgname-$pkgver
./configure --with-fusd=/usr --prefix=/usr
make || return 1
make DESTDIR=$startdir/pkg install
}

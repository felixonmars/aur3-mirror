# Maintainer: Igor Muzyka <muzyka-iv@mail.ru>
pkgname=myagent-im
pkgver=0.4.6
pkgrel=1
pkgdesc="Mail.Ru Agent"
arch=(i686 x86_64)
url="http://code.google.com/p/myagent-im/"
license="GPL2"
depends=('qt>=4.4' 'zlib' 'xapian-core' 'aspell' 'libxss' 'phonon')
makedepends=('gcc' 'flex' 'pkg-config' 'sed')
install='myagent-im.install'
source=(http://myagent-im.googlecode.com/files/myagent-im_$pkgver.tar.gz)
md5sums=('fa8b80d077185956777f471f5a147178')

build()
{
cd $srcdir/$pkgname
sed -e '/#include/ s/Phonon/phonon/' -i ./src/soundplayer.h
sed -e '/isEmpty(PREFIX):PREFIX/ s/\/usr\/local/\/usr/' -i ./src/src.pro
qmake
make
make INSTALL_ROOT="$pkgdir" install
}

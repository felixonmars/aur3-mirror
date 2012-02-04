pkgname=wireshark-zudp
_wiresharkver=1.6.5
pkgver=20120123
pkgrel=1
pkgdesc="zigbee plugin for wireshark"
arch=(i686 x86_64)
url="http://idsmart.dsr-wireless.com/"
license=('GPL')
depends=('wireshark-cli')
makedepends=()
options=()
install=
source=(http://www.wireshark.org/download/src/wireshark-${_wiresharkver}.tar.bz2
	zudp.tar.gz)
md5sums=('794948a10d387fc8e37d824ea11dbac9'
         'f62ec0af4026a233a85067bbf26a35a8')

build() {
  cd "$srcdir/"
  cp -a zudp wireshark-${_wiresharkver}/plugins/

  cd wireshark-${_wiresharkver}
  sed -i 's|python|python2|g' autogen.sh
  patch -p0 plugins/Makefile.am <<EOF
41c41,42
< 	wimaxasncp
---
> 	wimaxasncp \\
> 	zudp
EOF
  patch -p0 configure.in <<EOF
2018a2019
>   plugins/zudp/Makefile
EOF
  automake --add-missing || true
  autoconf -i
  ./autogen.sh
  ./configure \
      --prefix=/usr \
      --with-ssl \
      --with-zlib=yes \
      --with-lua
  make all PYTHON=python2
}

package() {
  cd "$srcdir/wireshark-${_wiresharkver}"
  install -Dm0755 plugins/zudp/.libs/zudp.so $pkgdir/usr/lib/wireshark/plugins/${_wiresharkver}/zudp.so
}

# Contributor: Majki <majki@majki.hu>
pkgname=ovpngui
pkgver=1.0.1
pkgrel=5
pkgdesc="OpenVPN GUI for Linux (windows clone)"
arch=('i686' 'x86_64')
url="http://majki.hu"
license=('Custom')
depends=('libx11' 'glibc' 'libxft>=2' 'fontconfig' 'zlib' 'libpng>=1.4' 'gcc-libs' 'freetype2' 'libxrender' 'libxcb' 'expat' 'libxau' 'libxdmcp')
makedepends=('tar' 'gzip')
requires=('openvpn')
source=(http://majki.hu/ovpngui-$pkgver-$CARCH.tgz)
if [ "$CARCH" == "i686" ]; then
  md5sums=('1dbafda9ca50813ed18b24af0290e99b')
else
  md5sums=('73392a9515d03525deb6d75194dafc1d')
fi

build() {
  cd "$pkgdir"
  tar --exclude=usr/lib -xzpf "$srcdir/ovpngui-$pkgver-$CARCH.tgz"
}


# Maintainer: Valentin Elovsky evvsoft@gmail.com
pkgname=ivideon-video-server-nogui
pkgver=3.4.4.37
pkgrel=1
pkgdesc="Ivideon video server (without GUI)"
arch=(i686 x86_64)
url="http://ivideon.ru/"
license=('freeware')
depends=("portaudio" "gstreamer0.10" "gstreamer0.10-base-plugins" "gstreamer0.10-good-plugins")
conflicts=('ivideon-video-server')
provides=("ivideon-video-server=$pkgver")
source=("videoserverd.service")
md5sums=('34600c5204956f089147ea5bac6a04ed')

if [[ "$CARCH" == "i686" ]]; then
  source+=("http://packages.ivideon.com/ubuntu/pool/non-free/i/ivideon-video-server/ivideon-video-server_${pkgver}_i386.deb")
  md5sums+=('f9c999eaddb53949a5602bf7f836a61c')
fi

if [[ "$CARCH" == "x86_64" ]]; then
  source+=("http://packages.ivideon.com/ubuntu/pool/non-free/i/ivideon-video-server/ivideon-video-server_${pkgver}_amd64.deb")
  md5sums+=('8c95dfee7aed6b905ba608740416d0dc')
fi

build() {
  cd "$srcdir"
  bsdtar xf "$srcdir/data.tar.gz"
  mkdir -p "$srcdir/usr/lib/systemd/system"
  cp videoserverd.service "$srcdir/usr/lib/systemd/system"
  rm "$srcdir/opt/ivideon/ivideon-server/init_ctl.sh"
  rm "$srcdir/opt/ivideon/ivideon-server/ivideon-server"
  rm -r "$srcdir/usr/bin"
  rm -r "$srcdir/usr/share"
}
  
package() {
  cp -dpr --no-preserve=ownership "$srcdir/opt" "$pkgdir"
  cp -dpr --no-preserve=ownership "$srcdir/usr" "$pkgdir"
}
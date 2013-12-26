pkgname=neorouter-client-free
pkgver=2.1.1.4300
pkgrel=1
pkgdesc="NeoRouter is a cross-platform zero-configuration VPN solution"

arch=('i686' 'x86_64' 'armv6h' 'armv7h')
_arch="$CARCH"
[ "$CARCH" = 'i686'   ] && _arch='i386'
[ "$CARCH" = 'x86_64' ] && _arch='x86_64'
[ "$CARCH" = 'armv6h' ] && _arch='armhf'
[ "$CARCH" = 'armv7h' ] && _arch='armhf'

url="http://www.neorouter.com/"
license=('custom')
depends=()
makedepends=("gendesk")
provides=()
conflicts=('nrclient-free')
install=nrclient-free.install

source=('nrclient.service'
        'neorouter-client-free.png'
        'neorouter-client-free.desktop')

md5sums=('051c0ba7598249e035368f8ecb6ea44d'
         '1cb5c0f89bb512a3d30a95b6c79a0366'
         'ba4c2ef8f0d2fd10387387825ad61372')

url_download="http://download.neorouter.com/Downloads/NRFree"
if test "$CARCH" == i386; then
  source+=(${url_download}/Update_${pkgver}/Linux/CentOS/nrclient-${pkgver}-free-centos-${_arch}.rpm)
  md5sums+=('376d099b1d71b40f415a3f845cd90777')
elif test "$CARCH" == x86_64; then
  source+=(${url_download}/Update_${pkgver}/Linux/CentOS/nrclient-${pkgver}-free-centos-${_arch}.rpm)
  md5sums+=('75ea32611eb0a162a550243ca81eecc8')
elif test "$_arch" == armhf; then
  source+=(${url_download}/Update_${pkgver}/inabox/Raspbian/nrclient-${pkgver}-free-raspbian-${_arch}.deb)
  md5sums+=('f92424290134d6fc5e9a865b9bb94ccf')
fi

package() {
  cd $srcdir/
  
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$pkgname.png"     "$pkgdir/usr/share/pixmaps/$pkgname.png"

  if test "$_arch" == armhf; then
      bsdtar xf nrclient-${pkgver}-free-raspbian-${_arch}.deb
      bsdtar xf data.tar.gz
  fi

  msg2 "Installing bin Files..."
  mkdir -p "$pkgdir/usr/bin"
  cp usr/bin/* "$pkgdir/usr/bin"

  msg2 "Installing readme files..."
  mkdir -p "$pkgdir/usr/local/ZebraNetworkSystems/NeoRouter/"
  cp usr/local/ZebraNetworkSystems/NeoRouter/* "$pkgdir/usr/local/ZebraNetworkSystems/NeoRouter/"

  msg2 "Installing systemd service..."
  mkdir -p $pkgdir/usr/lib/systemd/system/
  cp $startdir/nrclient.service $pkgdir/usr/lib/systemd/system/
}

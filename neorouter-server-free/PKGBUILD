pkgname=neorouter-server-free
pkgver=1.9.0.3800
pkgrel=1
pkgdesc="NeoRouter is a cross-platform zero-configuration VPN solution"
url="http://www.neorouter.com/"
license=('custom')
arch=('i686' 'x86_64' 'armv6h')
_arch="$CARCH"
[ "$CARCH" = 'i686' ] && _arch='i386'
[ "$CARCH" = 'armv6h' ] && _arch='armhf'
conflicts=()
provides=()
depends=()
makedepends=()
install=nrserver-free.install
source=(http://download.neorouter.com/Downloads/NRFree/Update_${pkgver}/Linux/CentOS/nrserver-${pkgver}-free-centos-${_arch}.rpm
'nrserver.service')
md5sums=('dc6005e77f52128a51b70e6d3ae33a34'
         'd36bf55b94871288697eead0f878614c')
if test "$CARCH" == x86_64; then
md5sums=('58cff42e0648523548c4fac781011219'
         'd36bf55b94871288697eead0f878614c')
fi
if test "$_arch" == armhf; then
source=(http://download.neorouter.com/Downloads/NRFree/Update_${pkgver}/inabox/Raspbian/nrserver-${pkgver}-free-raspbian-${_arch}.deb
'nrserver.service')
md5sums=('d390bd0cf4a4b52a8b2554ff65e3c3bb'
         'd36bf55b94871288697eead0f878614c')
fi

package() {
        cd $srcdir/

        if test "$_arch" == armhf; then
            bsdtar xf nrserver-${pkgver}-free-raspbian-${_arch}.deb
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
        cp $startdir/nrserver.service $pkgdir/usr/lib/systemd/system/
}

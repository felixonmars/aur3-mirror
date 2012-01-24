# Maintainer: flugbaer    <aur [at] amrit (dot) at>

pkgname=mytourbook
pkgver=12.1.0
pkgrel=2
pkgdesc="a tool to visualize and analyze tours recorded by a GPS device, ergometer, bike- or exercise computer"
arch=('i686' 'x86_64')
url="http://mytourbook.sourceforge.net"
license=("GPL")
depends=('java-runtime' 'fontconfig' 'libxrender')
source=("mytourbook.desktop")
md5sums=('428a78ad67746b149ccb8e70cc8b086b')

[ "$CARCH" = "i686" ] && source=(${source[@]} "http://downloads.sourceforge.net/project/mytourbook/MyTourbook/${pkgver}/mytourbook_${pkgver}.linux.gtk.x86.zip")
[ "$CARCH" = "x86_64"   ] && source=(${source[@]} "http://downloads.sourceforge.net/project/mytourbook/MyTourbook/${pkgver}/mytourbook_${pkgver}.linux.gtk.x86_64.zip")

[ "$CARCH" = "i686"   ] && md5sums=(${md5sums[@]} '19ebf3cbbcb36b6e73f6403667cd1cea')
[ "$CARCH" = "x86_64" ] && md5sums=(${md5sums[@]} '5c5eaa2184d9b444773559081cad5ef5')

build() {
true
}

package() {
mkdir -p ${pkgdir}/usr/{bin,share/mytourbook}
cd ${srcdir}/mytourbook
tar cf - * --exclude=.PKGINFO | ( cd ${pkgdir}/usr/share/mytourbook; tar xfp -)
find ${pkgdir}/usr/share/mytourbook -type f -print0 | xargs -0 chmod 644
chmod 755 ${pkgdir}/usr/share/mytourbook/mytourbook
ln -s /usr/share/mytourbook/mytourbook ${pkgdir}/usr/bin/mytourbook

install -D -m644 icon.xpm $pkgdir/usr/share/pixmaps/mytourbook.xpm
install -D -m644 $srcdir/mytourbook.desktop $pkgdir/usr/share/applications/mytourbook.desktop
}
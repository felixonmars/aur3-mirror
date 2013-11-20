# Maintainer: jellysheep <max DOT mail AT dameweb DOT de>
# Contributor: willemw <willemw12@gmail.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

pkgname=jmencode-gcj
_pkgname=jmencode
pkgver=0.64
_libver=1.0.1
pkgrel=5
pkgdesc="Java GUI for encoding video with mencoder (gcj compiled)."
arch=('i686' 'x86_64')
url="http://jmencode.sourceforge.net"
license=('GPL3')
depends=('mencoder' 'mplayer' 'mkvtoolnix' 'gpac' 'gcc-gcj')
source=(http://downloads.sourceforge.net/$_pkgname/JMencode_v$pkgver.zip
        $pkgname.desktop)
md5sums=('e008964c80ace65627e62883652df5af'
         'd95845089084759acd43437a42ae3db1')

build()
{
    cd ${srcdir}
    gcj lib/swing-layout-$_libver.jar JMEncode.jar --main=jmencode.MainGUI -o $pkgname
}

package()
{
    cd "$srcdir"
    install -D -m644 icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -D -m644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -D -m755 $pkgname "$pkgdir/usr/bin/$pkgname"
}


pkgname=icecat-bin
_pkgname=icecat
pkgver=3.6.13
pkgrel=1
pkgdesc="Official build of the GNU version of the Mozilla Firefox browser"
arch=('i686')
url="http://www.gnu.org/software/gnuzilla/"
license=('GPL2' 'MPL' 'LGPL')
depends=('gtk2' 'pango' 'libxt' 'libidl2' 'nss' 'libjpeg6')
makedepends=()
provides=('iceweasel-bin' 'iceweasel' 'mozilla-firebird' 'phoenix' 'swiftweasel' 'swiftfox')
conflicts=('icecat' 'icecat-cvs' 'iceweasel-bin')
replaces=('iceweasel-bin' 'icecat')
source=(ftp://ftp.gnu.org/gnu/gnuzilla/$pkgver/$_pkgname-$pkgver-i686.tar.bz2 \
	$_pkgname.desktop \
	$_pkgname-safe.desktop \
	$_pkgname.sh \
	$_pkgname-launcher.sh)
md5sums=('0c8065d19a2116ca927ed6b49df561a1'
         '3ace3b5b0397e8af119364874f3db52d'
         '977021e753319cb0b90371f4262b08c3'
         'dd7510847931935fa8d04b66ec2441d6'
         'a1c020386c7a705c164049ca56139b8f')

build() {
  install -d $pkgdir/usr/lib/$_pkgname

  cp -rf $srcdir/$_pkgname-$pkgver-i686/* $pkgdir/usr/lib/$_pkgname/ || return 1

  install -d $pkgdir/usr/share/applications
  install -m644 $srcdir/$_pkgname.desktop $pkgdir/usr/share/applications
  install -m644 $srcdir/$_pkgname-safe.desktop $pkgdir/usr/share/applications
  install -d $pkgdir/usr/share/pixmaps
  install -m644 $srcdir/$_pkgname-$pkgver-i686/icons/mozicon50.xpm $pkgdir/usr/share/pixmaps/$_pkgname.xpm
  install -d $pkgdir/etc/profile.d/
  install -m755 $srcdir/$_pkgname.sh $pkgdir/etc/profile.d/
  install -d $pkgdir/usr/bin/
  install -m755 $srcdir/$_pkgname-launcher.sh $pkgdir/usr/bin/$_pkgname-launcher
}

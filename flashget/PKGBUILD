pkgname=flashget
pkgver=1.0.3
pkgrel=1
pkgdesc="FlashGet is a leading Download Manager and has the highest amount of users on the internet. Beta version."
arch=('i686' 'x86_64')
url="http://bbs.flashget.com/forumdisplay.php?fid=31"
license=('custom')
if [ "$CARCH" = "x86_64" ]; then
	depends=('lib32-expat' 'lib32-libpng' 'lib32-gtk2' 'lib32-libxext' 'lib32-libsm' 'lib32-libxxf86vm' 'lib32-pangox-compat')
elif [ "$CARCH" = "i686" ]; then
	depends=('expat' 'libpng' 'gtk2' 'libxext' 'libsm' 'libxxf86vm' 'pangox-compat')
fi
install='wxflashget.install'
source=('http://mirror.bjtu.edu.cn/opensuse-underground/i586/flashget-1.0.3-0.i586.rpm')
md5sums=('66885bb5aa8831db896567719f69a154')
build() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/pixmaps
  mkdir -p $pkgdir/usr/share/applications
  install -m 755 $srcdir/usr/bin/flashget $pkgdir/usr/bin/
  install -m 644 $srcdir/usr/share/pixmaps/flashget.png $pkgdir/usr/share/pixmaps/
  install -m 644 $srcdir/usr/share/applications/flashget.desktop $pkgdir/usr/share/applications/
  if [ "$CARCH" = "x86_64" ]; then
	mkdir -p ${pkgdir}/usr/lib32/
	ln -s /usr/lib32/libexpat.so ${pkgdir}/usr/lib32/libexpat.so.0
  else
	mkdir -p ${pkgdir}/usr/lib/
	ln -s /usr/lib/libexpat.so ${pkgdir}/usr/lib/libexpat.so.0
  fi
}


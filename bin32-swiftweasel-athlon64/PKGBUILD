# Contributor: Kenzo Martins Matuzawa

pkgname=bin32-swiftweasel-athlon64
_pkgname=swiftweasel
_swiftver=_07-16-08_athlon64-32bit
pkgver=3.0.1
pkgrel=4
pkgdesc="optimized build of the Mozilla Firefox web browser for Linux."
arch=('x86_64')
url="http://swiftweasel.tuxfamily.org/"
depends=('desktop-file-utils' 'lib32-gtk2' 'lib32-libidl2' 'lib32-libxcomposite' 'lib32-libxdamage' 'lib32-libxt' 'lib32-nss' 'lib32-pcre' 'mozilla-common')
provides=("swiftweasel=$pkgver")
license=('GPL')
source=(http://downloads.sourceforge.net/swiftweasel/$_pkgname-$pkgver$_swiftver.tar.gz
	swiftweasel.desktop
	pango.modules
	pangorc
	swiftweasel.patch)
md5sums=('57aa7746d7fed74faf6662169fbf5d83'\
	 '7cae5f7cdce49ec732064e5a8ca488e4'\
	 '5f6dffa88820d572ebc325bbccebea97'\
	 'ed6827065cc2af4ed83c55a02de20bf7'\
	 'dcae3c0e7b41411772d331da46b10c56')

build() {
  cd $startdir/src/swiftweasel
  patch -p0 < $startdir/src/swiftweasel.patch
  cd $startdir/src

  mkdir $startdir/pkg/opt/
  cp -r $_pkgname $startdir/pkg/opt/$_pkgname
  mkdir -p $startdir/pkg/usr/bin
  ln -s /opt/$_pkgname/$_pkgname $startdir/pkg/usr/bin/$_pkgname

  mkdir -p $startdir/pkg/usr/share/applications
  mkdir -p $startdir/pkg/usr/share/pixmaps
  install -m644 $startdir/src/swiftweasel.desktop $startdir/pkg/usr/share/applications/
  install -m644 $startdir/src/swiftweasel/icons/mozicon128.png $startdir/pkg/usr/share/pixmaps/swiftweasel.png

  mkdir -p $startdir/pkg/etc/pango32
  install -m644 $startdir/src/pango.modules $startdir/pkg/etc/pango32/
  install -m644 $startdir/src/pangorc $startdir/pkg/etc/pango32/
}

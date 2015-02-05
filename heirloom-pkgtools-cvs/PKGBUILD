# Contributor: Sascha Biermmanns <saschakb at gmail dot com>
# Contributor: Jens Staal <staal1978@gmail.com>
pkgname=heirloom-pkgtools-cvs
pkgver=111210
pkgrel=4
arch=('i686' 'x86_64')
pkgdesc="The Heirloom Packaging Tools is a port of SVR4 application packaging utilities from OpenSolaris"
url="http://heirloom.sourceforge.net/pkgtools.html"
license=('custom:"caldera"' 'custom:"opensolaris"')
depends=('heirloom-sh-cvs' 'heirloom-devtools-cvs' 'heirloom-cvs')
makedepends=('cvs')
source=('000-config.diff')
md5sums=('7ab977ec2bafe3b55fa9c56fe541e0d5')

_hmake() {
	env PATH="/usr/heirloom/bin:$PATH" MAKEFLAGS="" make "$@"
}

build() {
  cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/heirloom login

  cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/heirloom co -P heirloom-pkgtools

  rm -rf $srcdir/build
  cp -r $srcdir/heirloom-pkgtools $srcdir/build
  cd $srcdir/build
  
  patch -p1 < ../000-config.diff

  _hmake
}

package() {
  cd $srcdir/build
  _hmake install ROOT=$pkgdir

	mkdir -p $pkgdir/usr/share/licenses/${pkgname}/
	mkdir -p $pkgdir/usr/share/licenses/ 
	install -m0644 $srcdir/heirloom-pkgtools/LICENSE/CALDERA.LICENSE $pkgdir/usr/share/licenses/${pkgname}/CALDERA.LICENSE
	install -m0644 $srcdir/heirloom-pkgtools/LICENSE/OPENSOLARIS.LICENSE $pkgdir/usr/share/licenses/${pkgname}
}
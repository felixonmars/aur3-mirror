# Maintainer: Jason Pierce <`echo 'moc tod liamg ta nosaj tod ecreip' | rev`>
# Contributor: Jason Pierce <`echo 'moc tod liamg ta nosaj tod ecreip' | rev`>
pkgname=uqx
pkgver=0.1
pkgrel=1
pkgdesc="Update Qingy Xsessions, for the session selection menu."
arch=( 'i686' 'x86_64' )
url="http://pg.projects.wholebean.info/uqx"
license=('MIT')
install="uqx.install"
depends=( 'bash' 'grep' 'coreutils' 'dash' )
optdepends=( 'qingy: If you find a use for this, without qingy, please inform the maintainer.' )
makedepends=( 'gcc' )
source=( "http://dl.projects.wholebean.info/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('57ecaa8d07b9e34abb474f451a591d3f')

build() {
	cd $srcdir

	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/$pkgname
	mkdir -p $pkgdir/usr/share/applications
	mkdir -p $pkgdir/usr/share/pixmaps
	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	mkdir -p $pkgdir/usr/share/docs/uqx
	mkdir -p $pkgdir/etc/qingy/xsessions
	mkdir -p $pkgdir/etc/qingy/sessions

	gcc -o uqx uqx.c

	mv ./${pkgname}.sh $pkgdir/usr/share/$pkgname/
	mv ./${pkgname}.desktop $pkgdir/usr/share/applications/
	mv ./${pkgname}.png $pkgdir/usr/share/pixmaps/
	mv ./COPYING $pkgdir/usr/share/licenses/$pkgname
	mv ./README $pkgdir/usr/share/docs/uqx/
	mv ./${pkgname} $pkgdir/usr/bin/$pkgname

	chmod 755 $pkgdir/usr/share/$pkgname/${pkgname}.sh
	chmod 755 $pkgdir/usr/bin/$pkgname
	chmod u+s $pkgdir/usr/bin/$pkgname

	ln -s /usr/bin/$pkgname $pkgdir/etc/qingy/sessions/Update_Qingy_Xsessions
}

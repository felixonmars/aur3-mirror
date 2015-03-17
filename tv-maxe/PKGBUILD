# Maintainer: @alumni
pkgname=tv-maxe
pkgver=0.11
pkgrel=1
pkgdesc="Free television for your Linux system"
arch=('i686' 'x86_64')
url="http://code.google.com/p/tv-maxe/"
license=('GPL')
depends=('python2' 'pygtk' 'libstdc++5' 'sopcast' 'gstreamer0.10-python' 'ffmpeg' 'python2-pillow' 'python-virtkey')
replaces=('tvmaxe')
conflicts=('tvmaxe')
optdepends=('vlc' 'mplayer' 'lirc' 'mencoder')
install=tv-maxe.install
source=(https://launchpad.net/~venerix/+archive/pkg/+files/${pkgname}_$pkgver-0ubuntu2~trusty.tar.gz $pkgname.desktop $pkgname.install)
md5sums=('49866c28341b33b71d31e81f0e9133f0'
         'eeea51d372b5f64cd836fe92da9a3455'
         '581dd0376025ecd8e2216db1f72126d4')

package() {
	cd $srcdir/$pkgname-$pkgver/$pkgname
	install -m 755 -d $pkgdir/usr/share/$pkgname
	install -m 644 -D $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -m 755 -D $pkgname $pkgdir/usr/bin/$pkgname
	cp -avx * $pkgdir/usr/share/$pkgname
	sed -i "s|python|python2|g" $pkgdir/usr/bin/$pkgname
}

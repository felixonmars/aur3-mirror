# Contributor: Yuhei Maeda <yuhei.maeda@gmail.com>
pkgname=mpd-twitter
pkgver=1.0
pkgrel=2
pkgdesc="Publish on twitter what you are listening on MPD"
arch=('i686' 'x86_64')
url="https://github.com/myuhe/mpd-twitter"
license=('GPL')
depends=('xdialog' 'curl' 'mpc' 'python2-twitter-git')
source=(https://github.com/myuhe/mpd-twitter/archive/v${pkgver}.tar.gz)
md5sums=('44495deb26564e097eedd12d0c36d89c')

package() {
	cd $srcdir/${pkgname}-${pkgver}
	install -d $pkgdir/usr/local/share/${pkgname}-${pkgver}
	mkdir $pkgdir/usr/bin
	install -m744 $srcdir/${pkgname}-${pkgver}/mpd-twitter.conf $pkgdir/usr/local/share/${pkgname}-${pkgver}/
	install -m755 $srcdir/${pkgname}-${pkgver}/mpd-twitter.py $pkgdir/usr/bin/
	chmod +x $pkgdir/usr/bin/mpd-twitter.py
}

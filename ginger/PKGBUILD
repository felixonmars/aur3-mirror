# Maintainer: The Ginger Team <ginger at ginger d0t ws>

pkgname=ginger
pkgver=0.9b260
pkgrel=1
pkgdesc="Ginger is a web-based RSS feed reader."
url="http://ginger.ws/ginger"
arch=('any')
license=('GPLv3')
depends=('python2' 'python2-feedparser' 'django' 'python2-psutil' 'apache' 'mod_wsgi2')
install='ginger.install'
source=("http://ginger.ws/wiki/ginger/_media/ginger_0.9b260.tar.gz")
md5sums=('8a408983a4dd8eb46580c42511c827f7')

#build() {
#}

package() {
	mkdir -p "$pkgdir/usr/share"
	cp -R "${srcdir}/${pkgname}-0.9b260" "$pkgdir/usr/share/ginger"
}

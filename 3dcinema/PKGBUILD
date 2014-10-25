# Maintainer: nemanjan00
pkgname=3dcinema
pkgver=1.3
pkgrel=1
pkgdesc="3D Cinema (webui for peerflix)"
arch=('any')
url="https://github.com/nemanjan00/3dcinema"
license=('Apache License')
depends=('peerflix' 'screen' 'php' 'apache')
source=('https://github.com/nemanjan00/3dcinema/releases/download/v1.3/v1.3.zip' 'httpd-3dcinema.conf' 'post_install.install')
install='post_install.install'

package() {
	cd $srcdir

	mkdir -p $pkgdir/usr/share/webapps/
	mv public $pkgdir/usr/share/webapps/3dcinema

	mkdir -p $pkgdir/etc/httpd/conf/extra
	cp httpd-3dcinema.conf /$pkgdir/etc/httpd/conf/extra/

	echo 
}

md5sums=('bd4ea3e6b115a8fc1ea3931c58cde691' '9578ec4f37b1229b105bc270db665605' '26e01c54e8331e43740840a24ad16103')

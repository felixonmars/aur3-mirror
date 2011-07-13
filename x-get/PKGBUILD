# Maintainer: EXio4 <exio4 dot com at gmail dot com>

pkgname=x-get
pkgver=0.3
pkgrel=3
pkgdesc='X-get .. a other wrapper of pacman.'
arch=('i686' 'x86_64')
depends=('pacman' 'packer')
url='http://x-get.blogspot.com/'
license=('GPL')
source=("http://dl.dropbox.com/u/13827983/${pkgname}/${pkgname}_${pkgver}.tar.gz")
md5sums=('f56808624500e4d768040d4e1f6af11e')
package()
{
	cd "${srcdir}/${pkgname}_${pkgver}"
	install -d -m 0755 "${pkgdir}/usr/bin/"
	mkdir -p $pkgdir/etc/
	install -Dm755 x-get "$pkgdir/usr/bin/x-get"
	install -Dm755 x-aur "$pkgdir/usr/bin/x-aur"
	msg "Usando packer por default.. si desea cambiarlo modifique /etc/x-aur.conf"
	echo "pkg=\"packer\"" > $pkgdir/etc/x-aur.conf
}

#Maintainer: Aleksuk Artyom <h31mail.yandex.com>

pkgname=host-on-imageshack
pkgver=0.7
pkgrel=1
arch=('any')
pkgdesc="A service menu to upload images on Imageshack, IPicture and oPicture"
url="http://www.kde-apps.org/content/show.php/Host+on+Imageshack?content=112342"
license="GPL"
depends=('kdebase')
source=(http://www.kde-apps.org/CONTENT/content-files/112342-imageshack_upload-0.7.tar.gz)
md5sums=('762b9a5bd919abd6f59c6e6cff460880')

build() {
	cd $srcdir/imageshack_upload

	install -m 755 -D imageshack_upload $pkgdir/usr/bin/imageshack_upload
	install -m 444 -D imageshack4.desktop $pkgdir/usr/share/kde4/services/ServiceMenus/imageshack4.desktop
}

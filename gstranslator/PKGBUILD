# Maintainer: thof <radlewand[at]o2[dot]pl>
pkgname=gstranslator
pkgver=0.3.2
pkgrel=1
pkgdesc="GSTranslator is a simple translator for Gnome 3."
url="http://gtk-apps.org/content/show.php?action=content&content=143888"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('glibc' 'gtk3' 'json-glib' 'libnotify' 'libxml2' 'curl')
source=("http://gtk-apps.org/CONTENT/content-files/143888-${pkgname}-${pkgver}.tar.gz")
md5sums=('54f45499bcb6daafe9f83be69889e424')

build() 
{
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package()
{
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
}

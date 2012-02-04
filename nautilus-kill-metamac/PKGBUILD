# Contributor: Perberos <perberos@gmail.com>

pkgname=nautilus-kill-metamac
pkgver=1.0
pkgrel=1
pkgdesc="Nautilus extension for auto-deleting Mac(TM) filesystem metadata files, like __MACOSX folders and .DS_Store files."
arch=('any')
url="http://GNOME-Look.org/content/show.php/Nautilus+Extension+Kill+MetaMac?action=content&content=140033"
license=('GPL3')
depends=('nautilus')
provides=('nautilus-kill-metamac')
install=
source=('http://matsusoft.com.ar/uploads/gnu-linux/nautilus-kill-metamac/nautilus-kill-metamac.tar.gz')
noextract=()
md5sums=('0be43894fc95b112bd5ba443a6e0a32c') 

build() {
	install -d ${pkgdir}/usr/lib/nautilus/extensions-2.0
	cd $srcdir/
	tar -xzvf nautilus-kill-metamac.tar.gz
	make || return 1
  	install -Dm755 kill-metamac.so $pkgdir/usr/lib/nautilus/extensions-2.0/libnautilus-kill-metamac.so || return 1
}

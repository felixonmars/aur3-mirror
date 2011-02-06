# Contributor: Thomas Mudrunka <harvie@@email..cz>
# Maintainer: Thomas Mudrunka <harvie@@email..cz>
# You can also contact me on http://blog.harvie.cz/

pkgname=rtorrent-screen
pkgver=1.0
pkgrel=1
pkgdesc="Simple rTorrent manager (keeps your torrents in screen transparently + allows you to monitor it using text file and Web UI)"
arch=('any')
license=('GPL')
url="http://aur.archlinux.org/packages.php?ID=27100"
depends=('bash' 'rtorrent' 'screen')
source=('rtorrent-screen.bash')
md5sums=('d6858fa1acfe57cdee9e6ffe6c9a841c')

build() {
	mkdir -p ${pkgdir}/usr/bin
	cp -f ${startdir}/rtorrent-screen.bash ${pkgdir}/usr/bin/rtorrent-screen
	chmod -R 755 ${pkgdir}/
}

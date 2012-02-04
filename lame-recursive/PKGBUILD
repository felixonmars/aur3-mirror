# Contributor: Thomas Mudrunka <harvie@@email..cz>
# Maintainer: Thomas Mudrunka <harvie@@email..cz>
# You can also contact me on http://blog.harvie.cz/

pkgname=lame-recursive
pkgver=1.1
pkgrel=1
pkgdesc='Recursively (re-)encodes directories full of audiofiles using multiple CPUs'
arch=('any')
license=('GPL')
url="http://aur.archlinux.org/packages.php?ID=27100"
depends=('bash' 'lame')
source=('lamer.bash')
md5sums=('a5e73a9c46c913852dc327c067c2e09c')

build() {
	mkdir -p ${pkgdir}/usr/bin
	cp -f ${startdir}/lamer.bash ${pkgdir}/usr/bin/lamer
	chmod -R 755 ${pkgdir}/
}

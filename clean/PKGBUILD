pkgname=clean
pkgver=2.4
_ver=24
pkgrel=3

pkgdesc="A pure and lazy function programming language"
url="http://wiki.clean.cs.ru.nl/Clean"
arch=('x86_64' 'i686')
license=('LGPL')

install=clean.install

source_i686=("http://clean.cs.ru.nl/download/Clean${_ver}/linux/clean${pkgver}.tar.gz")
source_x86_64=("http://clean.cs.ru.nl/download/Clean${_ver}/linux/clean${pkgver}_64.tar.gz")

md5sums_i686+=('c60ac576f0afb57a5f51091abde0107c')
md5sums_x86_64+=('bb7adb884c2c3fafb0465d8ca2a26d09')

prepare() {
	cd clean/bin
	./patch_bin clm CLEANLIB /opt/clean/lib/exe
	./patch_bin clm CLEANILIB /opt/clean/lib
	./patch_bin clm CLEANPATH /opt/clean/lib/StdEnv
}

package() {
	cd clean
	make INSTALL_DIR="$pkgdir"/opt/clean
	mkdir -p "$pkgdir"/usr/{bin,share/man/man1}
	ln -s /opt/clean/man/man1/clm.1.gz "$pkgdir"/usr/share/man/man1
	install -Dm644 CleanLicenseConditions.txt "$pkgdir"/usr/share/licenses/clean/LICENSE
}

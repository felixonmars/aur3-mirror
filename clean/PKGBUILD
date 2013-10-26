# Maintainer: Johannes Löthberg <johannes@kyriasis.com
# Contributor: Carl Mueller  archlinux at carlm e4ward com

pkgname=clean
pkgver=2.4
_ver=24
pkgrel=3
pkgdesc="A pure and lazy function programming language"
arch=('x86_64' 'i686')
url="http://wiki.clean.cs.ru.nl/Clean"
license=('LGPL')
install=clean.install
md5sums=('7fb1ec59242df939bb3b6aea6e4650c6')
if [[ "$CARCH" = "x86_64" ]]; then
	_suffix=_64
	md5sums+=('bb7adb884c2c3fafb0465d8ca2a26d09')
else
	md5sums+=('c60ac576f0afb57a5f51091abde0107c')
fi
source=('clean.install' "http://clean.cs.ru.nl/download/Clean${_ver}/linux/clean${pkgver}${_suffix}.tar.gz")

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

# vim: set ts=4 sw=4 noet:

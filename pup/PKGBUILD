# Maintainer: Pritam Baral <pritam [at} pritambaral [dot} com>

pkgname=pup
pkgver=0.3.7
pkgrel=1
pkgdesc="A command line tool for processing HTML."
arch=('i686' 'x86_64')
url="https://github.com/EricChiang/pup"
license=('MIT')
source=("https://github.com/EricChiang/pup/releases/download/v$pkgver/pup_linux_386.zip")
md5sums=('a615cfcda9f11dbd897b969f45be5b11')
if [ "$CARCH" = "x86_64" ]; then
  source=("https://github.com/EricChiang/pup/releases/download/v$pkgver/pup_linux_amd64.zip")
  md5sums=('e1e102383a5f6eba38f5cb492df1c882')
fi
source+=("https://github.com/EricChiang/pup/raw/v$pkgver/LICENSE")
md5sums+=('a98550ce25e61b1d40f1670e9857c6ff')

package() {
	cd "$srcdir/"

	mkdir -p "$pkgdir/usr/bin"
	install -p -m755 "pup" "$pkgdir/usr/bin/pup"

	mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
	install -m644 "LICENSE"	"$pkgdir/usr/share/licenses/$pkgname"
}

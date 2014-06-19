# Maintainer: Sasha Khamkov <sanusart@gmail.com>
pkgname=gisto
pkgver=0.2.5b
pkgrel=1
epoch=
pkgdesc="Cross-platform gist snippets management desktop application that allows you and your team share code snippets fast and easily. Based on GitHub Gist Infrastructure which means you can use all your existing snippets by connecting your GitHub account."
arch=("i686" "x86_64")
url="http://www.gistoapp.com/"
license=("MIT")
groups=()
options=(!strip)
depends=("libudev.so.0" "gconf")

_gisto_arch="x86"
[ "$CARCH" = "x86_64" ] && _gisto_arch="x86_64"

source=("http://download.gistoapp.com/Gisto-$pkgver-Linux_${_gisto_arch}.tar.gz")    

md5sums=('256ccbdd6ea5f33a6ec142ba5d6108e7')
[ "$CARCH" = "x86_64" ] && md5sums[0]='96c0cf1405363254af9414ad911cca56'

package() {

	mkdir -p $pkgdir/usr/{bin,share}
	cp -R $srcdir/Gisto-$pkgver-Linux_${_gisto_arch}/{bin,share} $pkgdir/usr/
	
}

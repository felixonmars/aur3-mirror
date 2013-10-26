# Maintainer: Sasha Khamkov <sanusart@gmail.com>
pkgname=gisto
pkgver=0.2.1b
pkgrel=1
epoch=
pkgdesc="Cross-platform gist snippets management desktop application that allows you and your team share code snippets fast and easily. Based on GitHub Gist Infrastructure which means you can use all your existing snippets by connecting your GitHub account."
arch=("i686" "x86_64")
url="http://www.gistoapp.com/"
license=("MIT")
groups=()
options=(!strip)
depends=("libudev.so.0")

_gisto_arch="x86"
[ "$CARCH" = "x86_64" ] && _gisto_arch="x86_64"

source=("http://download.gistoapp.com/Gisto-$pkgver-Linux_${_gisto_arch}.tar.gz")    

md5sums=('5eb6e9c6a9a1fd067cedda8b882dc992')
[ "$CARCH" = "x86_64" ] && md5sums[0]='d46f9a625531b5c7c3887e8ed83d9c39'

package() {

	mkdir -p $pkgdir/usr/{bin,share}
	cp -R $srcdir/Gisto-$pkgver-Linux_${_gisto_arch}/{bin,share} $pkgdir/usr/
	
}

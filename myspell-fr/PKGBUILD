pkgname=myspell-fr
pkgver=0.1
pkgrel=1
pkgdesc="The French dictionary for myspell (Hydro-Quebec version)"
url="http://pkgs.org/package/myspell-fr"
license="GPL"
arch=("any")
source=("http://archive.ubuntu.com/ubuntu/pool/main/i/ifrench/myspell-fr_1.4-25_all.deb")
md5sums=("cc2375e016eab1d2b1a8293e467b2959")
build() {
  bsdtar -xf data.tar.gz 
  cp -r $srcdir/usr/ $pkgdir/
}


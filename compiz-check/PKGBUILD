# Contributor: T - rttommy@gmail.com
pkgname=compiz-check
pkgver=0.4.5
pkgrel=1
pkgdesc="Tests if Compiz is able to run on your system."
url="http://forlong.blogage.de/article/pages/Compiz-Check"
arch=('i686' 'x86_64')
license=('GPL')
source=(http://blogage.de/files/9124/download)
md5sums=('1dc352b0c78e33b6a5df4fe4eb8073eb')
build() {
	cd "$startdir"
	install -D -m755 "download" "$pkgdir/usr/bin/$pkgname"
}


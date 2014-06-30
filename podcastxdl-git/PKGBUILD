# Maintainer: Levi (levi0x0)
pkgname=podcastxdl-git
pkgver=20140629
pkgrel=1
pkgdesc="A simple PodCast Downloader for the terminal."
url="https://github.com/levi0x0/PodCastXDL/"
license=("GPL3")
arch=('any')
makedepends=('git')
depends=('python2-feedparser')
#source=('git://github.com/levi0x0/PodCastXDL.git')
source=('git+https://github.com/levi0x0/PodCastXDL.git')
md5sums=('SKIP')

pkgver() {
    cd "PodCastXDL"
    git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

package() {
	cd "$srcdir/PodCastXDL"
	mkdir -p "$pkgdir/usr/bin/"
	install -Dm775 PodCastXDL.py "$pkgdir/usr/bin/podcastXDL"
}



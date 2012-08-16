# Maintainer: Stefano Gioffré <grossomalpelo at gmail dot com>
# Contributor: Martin Špelina shpelda [at] seznam [dot] cz

pkgname=bashbookmarks
pkgver=0.2.2
pkgrel=2
pkgdesc="Bookmarks support for bash"
arch=("i686" "x86_64")
url="http://bbs.archlinux.org/viewtopic.php?pid=649919"
license=("GPL")
depends=("bash" "bash-completion")
install="bash-bookmarks.install"
source=("bash_bookmarks_completion" "bash_bookmarks_function")
md5sums=("71ffdb32d5e522d957ac12dfd2c63b61" "2577558b5697744f24a5270b051a1869")

build() {
	mkdir -p $startdir/pkg/etc/bash_completion.d
	mkdir -p $startdir/pkg/etc/profile.d
	cp bash_bookmarks_completion $startdir/pkg/etc/bash_completion.d/bash_bookmarks
	cp bash_bookmarks_function $startdir/pkg/etc/profile.d/bash_bookmarks.sh
	chmod +x $startdir/pkg/etc/profile.d/bash_bookmarks.sh
}

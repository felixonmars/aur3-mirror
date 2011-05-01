# Maintainer: CUI Hao <cuihao.leo at gmail dot com>

pkgname=manpages-zh
pkgver=1.5.1
pkgrel=2
pkgdesc="This package contains the Chinese manual pages translated by the Chinese Man Pages Project (CMPP). Both Simplified Chinese and Traditional Chinese versions are provided."
arch=('any')
makedepends=('zh-autoconvert')
url="http://code.google.com/p/manpages-zh/"
license=('GPL')
source=(http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz)
sha1sums=('194b486b37b3407dee2cf26daa67cc1e3a99c7a9')

build() {
	cd $srcdir/$pkgname-$pkgver

	./configure --prefix=/usr || return 1
	make || return 1
	make DESTDIR="$pkgdir" install || return 1
}

package() {
	# 以下文件与软件包shadow、mencoder、mplayer冲突，故从本包删除。
	cd $pkgdir/usr/share/man/zh_CN
	rm -f \
		./man1/chfn* \
		./man1/newgrp* \
		./man1/chsh* \
		./man1/mencoder* \
		./man1/mplayer* \
		./man5/passwd* \
		./man8/userdel* \
		./man8/groupmod* \
		./man8/usermod* \
		./man8/groupdel* \
		./man8/chpasswd* \
		./man8/groupadd* \
		./man8/useradd*
		
	cd $pkgdir/usr/share/man/zh_TW
	rm -f \
		./man1/chfn* \
		./man1/newgrp* \
		./man1/chsh* \
		./man1/mencoder* \
		./man1/mplayer* \
		./man5/passwd* \
		./man8/userdel* \
		./man8/groupmod* \
		./man8/usermod* \
		./man8/groupdel* \
		./man8/chpasswd* \
		./man8/groupadd* \
		./man8/useradd*
}


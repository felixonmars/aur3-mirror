# Maintainer: Alexander De Sousa <archaur :dot: xandy21 :at: spamgourmet :dot: com>
# Contributor: stonecrest <stonecrestATgmailDOTcom>

pkgname=nathive
pkgver=0.924
pkgrel=3
pkgdesc="A software image editor focused on usability and logic."
arch=('i686' 'x86_64')
url="http://www.$pkgname.org/"
license=('GPL3')
depends=('gtk2>=2.18' 'pygtk' 'python2')
source=(http://www.nathive.org/dl/$pkgname-$pkgver.tgz)
md5sums=('37b76a856912713990e971f3d36efbf5')
sha1sums=('b3ec17ec3b5ba6be90e8c4b7f60029e2651998a0')

build() {
	cd $srcdir/$pkgname
  
	# Adjust paths:
	sed 's|BASE = /|BASE = ../../pkg/|g' -i makefile

	# Right now, Python 2.x is needed:
	if [ ! -e "$srcdir/python2-path" ]; then
		mkdir $srcdir/python2-path
		ln -s /usr/bin/python2 "$srcdir/python2-path/python"
	fi
	export PATH="$srcdir/python2-path/:$PATH"

	make
}

package() {
	cd $srcdir/$pkgname
	make install

	# Adjust paths and use the Python 2.x interpreter:
	sed 's|python|python2|g' -i "$pkgdir/usr/bin/nathive"
	sed 's|../../pkg||g' -i "$pkgdir/usr/bin/nathive"
	sed 's|../../pkg||g' -i "$pkgdir/usr/share/nathive/META"
}

# vim: set ft=sh ts=3 sw=3 tw=0:

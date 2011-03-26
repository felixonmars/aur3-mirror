pkgname=dpm
pkgver=0.0.20100312
pkgrel=2
pkgdesc='simple dmenu script that allows you to suspend or hibernate'
arch=('any')
url='http://bbs.archlinux.org/viewtopic.php?pid=724572'
license=('GPL')
depends=('pm-utils' 'dmenu')
install='dpm.install'

source=('dpm.sh')
md5sums=('3158764a4889ded0975192f185214a6b')

build() {
	install -d -m755 $pkgdir/usr/bin
	cp $srcdir/dpm.sh $pkgdir/usr/bin/dpm
	chmod 755 $pkgdir $pkgdir/usr/bin/dpm
}

pkgname=dnetcfg
pkgver=0.0.20100312
pkgrel=5
pkgdesc='simple dmenu script that allows you to connect via netcfg'
arch=('any')
url="http://bbs.archlinux.org/viewtopic.php?pid=724557"
license=('GPL')
depends=('netcfg' 'dmenu')
install='dnetcfg.install'

source=('dnetcfg.sh')
md5sums=('edda6e1f65427fa1dee3f217c13a9f36')

build() {
	install -d -m755 $pkgdir/usr/bin
	cp $srcdir/dnetcfg.sh $pkgdir/usr/bin/dnetcfg
	chmod 755 $pkgdir $pkgdir/usr/bin/dnetcfg
}

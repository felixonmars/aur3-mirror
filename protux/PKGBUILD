# Maintainer: M4rQu1Nh0S <zonadomarquinhos@gmail.com>
# Contributor Victor Aurélio (hotvic) <victor.feradecs@gmail.com>

pkgname=protux
pkgver=0.70.0
pkgrel=1
pkgdesc="is being developed to be a complete Digital Media Production tool, or Digital Media Workstation."
arch=('any')
url="http://protux.sourceforge.net/"
license=('GPL2')
depends=('java-runtime')
source=('http://protux.sourceforge.net/protux-0.70.0.tar.gz' 
'protux.sh' 'protux.desktop')
md5sums=('0b46e8cfad6d647e5bbce759cf4801a4' '6ec44bbcb0afbf45c83865196f13aace' '883cd174ff3a39b87eab09d139d9ca5c')

package() {
	cd $srcdir/$pkgname

	install -d $pkgdir/usr/share/licenses/$pkgname
	cp COPYING $pkgdir/usr/share/licenses/$pkgname

	install -d $pkgdir/usr/share/$pkgname
	cp -R -t $pkgdir/usr/share/$pkgname bin dist doc plugins resources manifest.mf protux

	install -Dm=755 $startdir/protux.sh $pkgdir/usr/bin/protux

	install -Dm=755 $srcdir/$pkgname/resources/images/protux.xpm $pkgdir/usr/share/icons/protux.xpm
	install -Dm=755 $startdir/protux.desktop $pkgdir/usr/share/applications/protux.desktop
}
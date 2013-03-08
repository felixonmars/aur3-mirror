# Maintainer: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Urs Wolfer <uwolfer @ fwo.ch>

pkgname=keepass2
pkgver=2.21
pkgrel=2
pkgdesc="KeePass2 Password Database"
arch=('any')
license=('gpl')
url="http://keepass.info"
depends=('mono' 'xdotool')
makedepends=('unzip')
source=("http://downloads.sourceforge.net/keepass/KeePass-${pkgver}.zip" "keepass2")
sha512sums=('74d2bca43db3122aba065c7c3efc9c2467669db85ad431c9039a294f1f3ed96f6a55f49d11f871b90fba1ee6a078fc669bfbefffef96dc084b42a6683a3f126c'
            '6c02f8a2c9e655eb2a5376c080dd5e524938a3dd980195dfaa3c7d1393aa48360385a673551e89f8587a2db6f90beeff4838da072b4ad9f4902c7bc9c20366bf')

build()
{
	mkdir -p $srcdir/opt/keepass2/
	cd $srcdir/opt/keepass2
	unzip -o $srcdir/KeePass-${pkgver}.zip
}

package()
{
        # Install font
	cp -rp opt $pkgdir
        install -d $pkgdir/usr/bin/
        install -m755 keepass2 $pkgdir/usr/bin/keepass2
}

# Contributor: Simon Lipp <sloonz+aur@gmail.com>

pkgname=jeuclid-swt
pkgver=3.0.3
pkgrel=1
pkgdesc="MathML renderer for Java [SWT renderer component]"
arch=(i686 x86_64)
url="http://jeuclid.sourceforge.net/"
license=(APACHE)
depends=('jre' 'jeuclid-core')
source=("http://downloads.sourceforge.net/jeuclid/jeuclid-$pkgver-distribution.zip")
md5sums=('228d66c70de8ced1f162aaf76477cfae')

build() {
	install -d $startdir/pkg/usr/share/java/jeuclid/ || return 1
	install --mode=644 $startdir/src/jeuclid-$pkgver/repo/net/sourceforge/jeuclid/jeuclid-swt/$pkgver/jeuclid-swt-$pkgver.jar \
	  $startdir/pkg/usr/share/java/jeuclid/jeuclid-swt.jar || return 1
}

# Contributor: Simon Lipp <sloonz+aur@gmail.com>

pkgname=jeuclid-mathviewer
pkgver=3.0.3
pkgrel=1
pkgdesc="MathML renderer for Java [MathML viewver application]"
arch=(i686 x86_64)
url="http://jeuclid.sourceforge.net/"
license=(APACHE)
depends=('jre' 'jeuclid-core')
source=("http://downloads.sourceforge.net/jeuclid/jeuclid-$pkgver-distribution.zip"
        "fix-classpath.patch")
md5sums=('228d66c70de8ced1f162aaf76477cfae'
         '4d161e294913eb3d093ffc28057c6c97')

build() {
	cd $startdir/src/jeuclid-$pkgver
	patch -p1 < $startdir/src/fix-classpath.patch || return 1

	install -d $startdir/pkg/usr/bin/ || return 1
	install -d $startdir/pkg/usr/share/java/jeuclid/ || return 1
	install --mode=644 $startdir/src/jeuclid-$pkgver/repo/net/sourceforge/jeuclid/jeuclid-mathviewer/$pkgver/jeuclid-mathviewer-$pkgver.jar \
	  $startdir/pkg/usr/share/java/jeuclid/jeuclid-mathviewer.jar || return 1
	install $startdir/src/jeuclid-$pkgver/bin/mathviewer $startdir/pkg/usr/bin/ || return 1
}

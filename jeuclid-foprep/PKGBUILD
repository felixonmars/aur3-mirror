# Contributor: Simon Lipp <sloonz+aur@gmail.com>

pkgname=jeuclid-foprep
pkgver=3.0.3
pkgrel=1
pkgdesc="MathML renderer for Java [FO preprocessor]"
arch=(i686 x86_64)
url="http://jeuclid.sourceforge.net/"
license=(APACHE)
depends=('jre' 'jeuclid-core')
source=("http://downloads.sourceforge.net/jeuclid/jeuclid-$pkgver-distribution.zip"
        "fix-classpath.patch")
md5sums=('228d66c70de8ced1f162aaf76477cfae'
         '05eaffb1274917bef5a8a89c5fb776fd')

build() {
	cd $startdir/src/jeuclid-$pkgver
	patch -p1 < $startdir/src/fix-classpath.patch || return 1
	
	install -d $startdir/pkg/usr/bin/ || return 1
	install -d $startdir/pkg/usr/share/java/jeuclid/ || return 1
	install --mode=644 $startdir/src/jeuclid-$pkgver/repo/net/sourceforge/jeuclid/jeuclid-foprep/$pkgver/jeuclid-foprep-$pkgver.jar \
	  $startdir/pkg/usr/share/java/jeuclid/jeuclid-foprep.jar || return 1
	install $startdir/src/jeuclid-$pkgver/bin/foprep $startdir/pkg/usr/bin/ || return 1
	
	# Install embedded dependencies
	install --mode=644 $startdir/src/jeuclid-$pkgver/repo/commons-lang/commons-lang/1.0/commons-lang-1.0.jar \
	  $startdir/pkg/usr/share/java/jeuclid || return 1
	install --mode=644 $startdir/src/jeuclid-$pkgver/repo/commons-cli/commons-cli/1.0/commons-cli-1.0.jar \
	  $startdir/pkg/usr/share/java/jeuclid || return 1
}

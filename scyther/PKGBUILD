
# Maintainer: Luca Fulchir <luca@fulchir.it>

pkgname=scyther
pkgver=v1.1.3
pkgrel=1
pkgdesc="Tool for the symbolic analysis of security protocols"
arch=('i686' 'x86_64')
depends=('python2' 'graphviz' 'wxpython')
url="http://people.inf.ethz.ch/cremersc/scyther/"
license=('GPL')
source=("http://www.cs.ox.ac.uk/people/cas.cremers/downloads/scyther/scyther-linux-${pkgver}.tgz" 'scyther.desktop')
md5sums=('b7343d0a43b36c7b0f823d30c7b279ac'
         '3f09cd0a790e58c8c42b129118ecde8e')
sha1sums=('609658a06ed3d1b9bb594ca0c44cffe51677eeca'
          '293a960b39ffcc3d26480713b29505d94d08701f')
sha256sums=('5829daf7252ca92ed40041bbdb0012c091d36f16855d802ed7a792f3f8dad6a6'
            'd3bc8366a76892d47252c517246310e76e8e14af7856fb85a89b7e1de1c9dc07')

package() {
	cd "$srcdir/$pkgname-linux-$pkgver"
	mkdir -p $pkgdir/usr/{bin,share/applications}
	cp -a $srcdir/$pkgname-linux-$pkgver $pkgdir/usr/share/$pkgname-$pkgver
	cat > $pkgdir/usr/bin/scyther << EOF
#!/bin/sh
/usr/bin/python2 /usr/share/$pkgname-$pkgver/scyther-gui.py
EOF
	chmod +x $pkgdir/usr/bin/scyther
	chmod 755 $pkgdir/usr/bin/scyther
	cp $srcdir/scyther.desktop $pkgdir/usr/share/applications/
}


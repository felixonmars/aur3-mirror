#Contributor: onny <onny@project-insanity.org>
#Maintainer: onny <onny@project-insanity.org>

pkgname=collide
pkgver=20120707
pkgrel=1
pkgdesc="An open-source 'collaborative IDE' demonstration"
url="http://code.google.com/p/collide"
arch=('i686' 'x86_64')
license=('APACHE')
depends=('apache-ant' 'java-runtime')
source=("http://collide.googlecode.com/files/collide-dist-2012-07-07.tar.bz2")
md5sums=('9368adfe6564147bda38c27f58a9882f')
package() {
	install -d "$pkgdir"/opt/collide "$pkgdir"/usr/bin
	cp -r "$srcdir"/lib "$srcdir"/static "$srcdir"/collide "$srcdir"/bootstrap.js "$pkgdir"/opt/collide/
	chmod -R 775 "$pkgdir"/opt/collide
	echo -e "#!/bin/bash\n/opt/collide/collide \$@" > $pkgdir/usr/bin/collide
	chmod a+x "$pkgdir"/usr/bin/collide
}

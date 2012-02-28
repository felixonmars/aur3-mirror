# Contributor: Jonathan Wiersma <archaur at jonw dot org>

pkgname=java3d-openjdk6
pkgver=1.5.2
pkgrel=1
pkgdesc="High-level constructs to create and manipulate 3D geometry. Installs in openjdk6-directory."
arch=('i686' 'x86_64')
url="https://java3d.dev.java.net/"
license=('custom:"JRL"')
provides=("java3d=$pkgver-$pkgrel")
depends=('java-runtime=6' 'libgl')
makedepends=('unzip')
_pkgname=j3d
if [ "$CARCH" = "i686" ] ; then
	_arch=i586
    md5sums=('0501179d850e6d05d30f2a3df861c2a5')
else
	_arch=amd64
    md5sums=('541d5038c54bbec2f1d311dfc5f68890')
fi
source=(http://download.java.net/media/java3d/builds/release/$pkgver/$_pkgname-${pkgver//./_}-linux-$_arch.zip)

_JAVA_HOME=/usr/lib/jvm/java-6-openjdk

package() {
	cd $srcdir/$_pkgname-${pkgver//./_}-linux-$_arch
	install -D -m644 LICENSE-Java3D-v${pkgver//./_}.txt $pkgdir/usr/share/licenses/$_pkgname/LICENSE

	install -d -m755 $pkgdir/$_JAVA_HOME/jre
	cd $pkgdir/$_JAVA_HOME/jre
	unzip $srcdir/$_pkgname-${pkgver//./_}-linux-$_arch/$_pkgname-jre.zip
}


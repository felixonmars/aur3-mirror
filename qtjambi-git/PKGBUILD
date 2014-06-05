pkgname=qtjambi-git
pkgver=4070.3952b53
_qtver=4.8.6
pkgrel=1

arch=('i686' 'x86_64')

pkgdesc="Java bindings for the Qt C++ toolkit."
url='http://qt-jambi.org/'
license=('GPL')

source=('git://git.smar.fi/qtjambi-community.git' 'build.properties.patch' 'webkit.patch')
md5sums=('SKIP' '930fd1ac18e915d0db6e59a465be5ef1' '9f9ddb0719c304f9807fec10d46a4b76')

depends=("qt4>=$_qtver" 'java-environment>=6')
makedepends=('phonon' 'wget' 'apache-ant')
conflicts=('qtjambi')
provides=("qtjambi=$_qtver")

pkgver() {
	cd "$srcdir/qtjambi-community"
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
	cd "$srcdir/qtjambi-community"
	
	patch -p0 < "$srcdir/build.properties.patch"
	patch -p0 < "$srcdir/webkit.patch"
	
	export MAKEOPTS='-j8'
	
	ant all qtjambi.source
}

package() {
	cd "$srcdir/qtjambi-community"
	
	# Install qtjambi
	install -d "$pkgdir/usr/share/java/"
	install -m644 qtjambi-*.jar "$pkgdir/usr/share/java/"
	install -m644 "qtjambi-$_qtver-src.zip" "$pkgdir/usr/share/java/"
	
	# Install qtjambi-jni
	install -d "$pkgdir/usr/lib/jni/"
	install -m644 build/platform-output/lib/libcom_trolltech_qt_* build/platform-output/lib/libqtjambi.so* "$pkgdir/usr/lib/jni/"
	
	# Install qtjambi-designer
	install -d "$pkgdir/usr/lib/qt4/plugins/designer/"
	install -m644 build/platform-output/plugins-designer/designer/*.so "$pkgdir/usr/lib/qt4/plugins/designer/"
}
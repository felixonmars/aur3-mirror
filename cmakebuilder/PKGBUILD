# Contributor: Leo von Klenze <leo.vonklenze@tngtech.com> 
pkgname="cmakebuilder"
pkgver=1.2.0
pkgrel=1
pkgdesc="CMake Builder for Eclipse"
arch=('i686' 'x86_64')
url="http://www.cmakebuilder.com"
license=('GPL')
depends=('eclipse')
source=(http://www.cmakebuilder.com/update/features/com.janua.cmakebuilder_$pkgver.jar)
md5sums=('8aeee86315eed19bf2887339dc9ae0a4')

build()
{
	mkdir -p "$pkgdir"/usr/share/eclipse/dropins/cmakebuilder/eclipse/features
	mkdir -p "$pkgdir"/usr/share/eclipse/dropins/cmakebuilder/eclipse/plugins
	cp -a "$srcdir"/feature.xml "$srcdir"/META-INF "$pkgdir"/usr/share/eclipse/dropins/cmakebuilder/eclipse/features/
	cd "$pkgdir"/usr/share/eclipse/dropins/cmakebuilder/eclipse/plugins
	wget http://www.cmakebuilder.com/update/plugins/com.janua.cmakebuilder_$pkgver.jar
}


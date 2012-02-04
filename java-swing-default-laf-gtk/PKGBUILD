# Contributor: Thomas Mudrunka <harvie@@email..cz>
# Maintainer: Thomas Mudrunka <harvie@@email..cz>
# You can also contact me on http://blog.harvie.cz/

pkgname=java-swing-default-laf-gtk
pkgver=1
pkgrel=1
pkgdesc='Set default java (swing) applications appearance (LookAndFeel) to native GTK+ using swing.properties file'
arch=('any')
license=('Copyleft')
url='http://java.sun.com/docs/books/tutorial/uiswing/lookandfeel/plaf.html'
depends=('java-runtime')

source=('swing.properties')
md5sums=('c13b8a070befe250214da2558b227a6c')

build() {
	#you can modify swing.properties to use different LookAndFeel
	#you can also add more directories here (when you have multiple java instalations)
  for i in '/opt/java/jre/lib' '/opt/java/lib'; do
		msg2 "installing swing.properties to $i";
  	mkdir -p ${pkgdir}${i}/ || return 1
		cp swing.properties ${pkgdir}${i}/ || return 1
	done;
}

pkgname=eclipse-jstestdriver
pkgver=1.1.1.e
pkgrel=0
pkgdesc="JS Test Driver Plugin for Eclipse"
arch=(i686 x86_64)
url="http://code.google.com/p/js-test-driver"
license=('Apache License 2.0')
depends=('eclipse')
source=('http://js-test-driver.googlecode.com/svn/update/features/com.google.eclipse.javascript.jstestdriver.feature_1.1.1.e.jar'
	'http://js-test-driver.googlecode.com/svn/update/plugins/com.google.eclipse.javascript.jstestdriver.core_1.1.1.e.jar'
	'http://js-test-driver.googlecode.com/svn/update/plugins/com.google.eclipse.javascript.jstestdriver.ui_1.1.1.e.jar')
noextract=('http://js-test-driver.googlecode.com/svn/update/features/com.google.eclipse.javascript.jstestdriver.feature_1.1.1.e.jar'
	'http://js-test-driver.googlecode.com/svn/update/plugins/com.google.eclipse.javascript.jstestdriver.core_1.1.1.e.jar'
	'http://js-test-driver.googlecode.com/svn/update/plugins/com.google.eclipse.javascript.jstestdriver.ui_1.1.1.e.jar')
md5sums=('5ac91d145873eef9e95154d20bc7a947'
	'1c51e11b6745182b4087881dd776d1a4'
	'c1ead5af1a0f748424635a4e20b3679a')

build() {
        mkdir -p $pkgdir/usr/share/eclipse/dropins/jstestdriver/eclipse/features
        mkdir -p $pkgdir/usr/share/eclipse/dropins/jstestdriver/eclipse/plugins
        
        cp 'com.google.eclipse.javascript.jstestdriver.feature_1.1.1.e.jar' $pkgdir/usr/share/eclipse/dropins/jstestdriver/eclipse/features
        cp 'com.google.eclipse.javascript.jstestdriver.core_1.1.1.e.jar' 'com.google.eclipse.javascript.jstestdriver.ui_1.1.1.e.jar' $pkgdir/usr/share/eclipse/dropins/jstestdriver/eclipse/plugins
        

        find $pkgdir/usr/share/eclipse -type d -exec chmod 755 {} \;
        find $pkgdir/usr/share/eclipse -type f -exec chmod 644 {} \;
}

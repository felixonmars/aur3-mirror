pkgname=eclipse-epic
plugindir=epic
pkgver=0.7.0
pkgrel=1
pkgdesc="Perl development framework for the Eclipse platform"
arch=(i686 x86_64)
url="http://e-p-i-c.sourceforge.net/"
license=(GPL)
depends=(eclipse perl)
source=('feature_org.epic.feature.main_0.7.0.jar::http://e-p-i-c.sf.net/updates/testing/features/org.epic.feature.main_0.7.0.jar'
	'plugin_org.epic.regexp_0.7.0.jar::http://e-p-i-c.sf.net/updates/testing/plugins/org.epic.regexp_0.7.0.jar'
	'plugin_org.epic.perleditor_0.7.0.jar::http://e-p-i-c.sf.net/updates/testing/plugins/org.epic.perleditor_0.7.0.jar'
	'plugin_org.epic.doc_0.7.0.jar::http://e-p-i-c.sf.net/updates/testing/plugins/org.epic.doc_0.7.0.jar'
	'plugin_org.epic.debug_0.7.0.jar::http://e-p-i-c.sf.net/updates/testing/plugins/org.epic.debug_0.7.0.jar'
	'plugin_org.epic.lib_0.7.0.jar::http://e-p-i-c.sf.net/updates/testing/plugins/org.epic.lib_0.7.0.jar'
	'plugin_org.epic.source_0.7.0.jar::http://e-p-i-c.sf.net/updates/testing/plugins/org.epic.source_0.7.0.jar')
noextract=('feature_org.epic.feature.main_0.7.0.jar::http://e-p-i-c.sf.net/updates/testing/features/org.epic.feature.main_0.7.0.jar'
	'plugin_org.epic.regexp_0.7.0.jar::http://e-p-i-c.sf.net/updates/testing/plugins/org.epic.regexp_0.7.0.jar'
	'plugin_org.epic.perleditor_0.7.0.jar::http://e-p-i-c.sf.net/updates/testing/plugins/org.epic.perleditor_0.7.0.jar'
	'plugin_org.epic.doc_0.7.0.jar::http://e-p-i-c.sf.net/updates/testing/plugins/org.epic.doc_0.7.0.jar'
	'plugin_org.epic.debug_0.7.0.jar::http://e-p-i-c.sf.net/updates/testing/plugins/org.epic.debug_0.7.0.jar'
	'plugin_org.epic.lib_0.7.0.jar::http://e-p-i-c.sf.net/updates/testing/plugins/org.epic.lib_0.7.0.jar'
	'plugin_org.epic.source_0.7.0.jar::http://e-p-i-c.sf.net/updates/testing/plugins/org.epic.source_0.7.0.jar')
md5sums=('33d779d0f583821a891515e098f0dff3'
	'8c17c1c841989c7f19f9ad23b8a9707c'
	'56f8723a0ec6251b465857deebd626f4'
	'fc4e60c738ad167c321e5a3c4c1442ee'
	'0b7140831f4cd6af8356c4ea9d161135'
	'e7b528b7a07386acf1a62d423da1fb8d'
	'3c3be41d4a4b94eb2a7c4697ee351339')

package() {
        mkdir -p $pkgdir/usr/share/eclipse/dropins/$plugindir/eclipse/features
        mkdir -p $pkgdir/usr/share/eclipse/dropins/$plugindir/eclipse/plugins
        
        cp 'feature_org.epic.feature.main_0.7.0.jar' $pkgdir/usr/share/eclipse/dropins/$plugindir/eclipse/features
        cp 'plugin_org.epic.regexp_0.7.0.jar' 'plugin_org.epic.perleditor_0.7.0.jar' 'plugin_org.epic.doc_0.7.0.jar' 'plugin_org.epic.debug_0.7.0.jar' 'plugin_org.epic.lib_0.7.0.jar' 'plugin_org.epic.source_0.7.0.jar' $pkgdir/usr/share/eclipse/dropins/$plugindir/eclipse/plugins

        find $pkgdir/usr/share/eclipse -type d -exec chmod 755 {} \;
        find $pkgdir/usr/share/eclipse -type f -exec chmod 644 {} \;
}


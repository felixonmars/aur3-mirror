# Contributor : Bryce Nordgren <bnordgren@fs.fed.us>

pkgname=alfresco-community-tomcat6
pkgver=3.4.d
pkgrel=1
pkgdesc="Installs the Alfresco instance in a Tomcat 6 servlet container."
url="http://www.alfresco.com"
license=('custom:PD')
arch=('any')
source=(alfresco-update.sh alfresco.xml share.xml)
md5sums=('9d61c7949a0eb488afd528f5096f3793'
         'f325396fee05a0009091a11bc1ce8cb8'
         '280105eaeeacb1f0d0e581ff5d37c75e')
depends=('tomcat6' 'alfresco-community-base'=$pkgver)
groups=('alfresco')
optdepends=()
makedepends=(  )

options=()
install=install

package() {
        alf_conf=/etc/webapps/alfresco

	#
	# tomcat directory structure modification
	#
	tomcat_share=$pkgdir/usr/share/tomcat/shared
	mkdir -p $tomcat_share/classes
	mkdir -p $tomcat_share/lib
	cd $tomcat_share/classes
	ln -s $alf_conf/conf/alfresco
	ln -s $alf_conf/conf/alfresco-global.properties


	#
	# Place the convenience MMT script in /usr/sbin
	#
	mkdir -p $pkgdir/usr/sbin
	install --mode=755 $startdir/alfresco-update.sh $pkgdir/usr/sbin

	#
	# Deploy the app by placing the context fragment in Tomcat's 
	# config directory
	# 
	tomcat_conf=$pkgdir/etc/tomcat.d/Catalina/localhost
	mkdir -p $tomcat_conf
	cp $startdir/alfresco.xml $tomcat_conf
	cp $startdir/share.xml $tomcat_conf


	# Install the license file
	install -D -m644 $startdir/17USC105.html \
	  $pkgdir/usr/share/licenses/${pkgname}/17USC105.html

}
# vim: set ft=sh ts=2 sw=2 et:

# Contributor : Bryce Nordgren <bnordgren@fs.fed.us>

pkgname=alfresco-community-tomcat6
pkgver=3.4.d
pkgrel=3
pkgdesc="Installs the Alfresco instance in a Tomcat 6 servlet container."
url="http://www.alfresco.com"
license=('custom:PD')
arch=('any')
source=(alfresco-update.sh alfresco.xml share.xml 17USC105.html)
md5sums=('9d61c7949a0eb488afd528f5096f3793'
         'f325396fee05a0009091a11bc1ce8cb8'
         '280105eaeeacb1f0d0e581ff5d37c75e'
         '092b82dd629e45807049ad6ae16f45e8')
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
	tomcat_share=$pkgdir/usr/share/tomcat6/shared
	mkdir -p $tomcat_share/classes
	mkdir -p $tomcat_share/lib
	cd $tomcat_share/classes
	ln -s $alf_conf/conf/alfresco
	ln -s $alf_conf/conf/alfresco-global.properties


	#
	# Place the convenience MMT script in /usr/sbin
	#
	mkdir -p $pkgdir/usr/sbin
	install --mode=755 $srcdir/alfresco-update.sh $pkgdir/usr/sbin

	#
	# Deploy the app by placing the context fragment in Tomcat's 
	# config directory
	# 
	tomcat_conf=$pkgdir/etc/tomcat6/Catalina/localhost
	mkdir -p $tomcat_conf
	cp $srcdir/alfresco.xml $tomcat_conf
	cp $srcdir/share.xml $tomcat_conf


	# Install the license file
	install -D -m644 $srcdir/17USC105.html \
	  $pkgdir/usr/share/licenses/${pkgname}/17USC105.html

}
# vim: set ft=sh ts=2 sw=2 et:

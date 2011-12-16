# Contributor : Bryce Nordgren <bnordgren@fs.fed.us>

pkgname=alfresco-community-base
pkgver=3.4.d
pkgrel=2
pkgdesc="The most scalable Java content repository that runs on commodity hardware and software."
url="http://www.alfresco.com"
replaces=(alfresco-community-mmt)
license=('custom')
arch=('any')
source=(http://sourceforge.net/projects/alfresco/files/Alfresco%203.4.d%20Community/alfresco-community-$pkgver.zip
      apply_amps.sh mmt)
md5sums=('2bc3fe66ed7cb24fb6b449eb7a36abd4'
         'b1f609689db57b917f8ae569fe073108'
         '9304799397c0546936bc56a3748a1712')
depends=('java-runtime>=6' 'libreoffice-common')
optdepends=('imagemagick: Image manipulation and preview')
groups=('alfresco')
makedepends=( )

options=()
install=

package() {

	# Make the alfresco directories
	alf_dir=$pkgdir/usr/share/webapps/alfresco
	alf_conf=$pkgdir/etc/webapps/alfresco
        alf_apps=$pkgdir/usr/share/java/alfresco
	mkdir -p $alf_dir
	mkdir -p $alf_conf
	mkdir -p $alf_apps

	# Copy application jarfiles
	mv $srcdir/bin/*.jar $alf_apps

	# Copy command line files to /usr/bin
	mkdir -p $pkgdir/usr/bin
	install --mode=755 $srcdir/apply_amps.sh $pkgdir/usr/bin
	install --mode=755 $srcdir/mmt $pkgdir/usr/bin

	# Install the WARfiles.
	mv $srcdir/web-server/webapps/*.war $alf_dir

	# Install the configuration directory tree over
	mv $srcdir/web-server/shared/classes $alf_conf/conf
	cd $alf_dir
	ln -s /etc/webapps/alfresco/conf

	# Install the example Tomcat6 setup
	mv $srcdir/web-server/conf $alf_conf/tomcat_setup

	#
	# Licensing is "complicated" and/or "mixed".  Ergo, 
	# just move the entire licensing directory over to 
	# /usr/share/licenses/alfresco
	#
	mkdir -p $pkgdir/usr/share/licenses
	mv $srcdir/licenses $pkgdir/usr/share/licenses/alfresco
	mv $srcdir/README.txt $pkgdir/usr/share/licenses/alfresco

	# make a directory to hold the "amps" (Alfresco Package Files)
	mkdir -p $alf_dir/amps
	mkdir -p $alf_dir/amps_share
}
# vim: set ft=sh ts=2 sw=2 et:

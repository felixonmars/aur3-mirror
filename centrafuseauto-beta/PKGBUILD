pkgname=centrafuseauto-beta
pkgver=4.0.14
pkgrel=1
pkgdesc="A complete automotive infotainment software suite"
url="https://www.centrafuse.com"
arch=('i686' 'x86_64')
license=("unknown")
source=("http://dl.dropbox.com/u/28660381/Linux%20Repo/x86/Centrafuse_4.0.14_Linux_x86.tar.gz")
md5sums=('ad7fff09adfd35e3f8b02c295f23600b')
depends=('mono' 'gstreamer0.10-ffmpeg' 'gstreamer0.10-ugly' 'gstreamer0.10-ugly-plugins' 'gstreamer0.10-bad' 'gstreamer0.10-bad-plugins' 'gstreamer0.10-base' 'gstreamer0.10-base-plugins' 'gstreamer0.10' 'flite' 'ecasound' 'gstreamer-sharp' 'sphinxbase' 'pocketsphinx')
install="centrafuse-beta.install"

package() {
	cd $srcdir/

	# Create directories that might not be included in TAR
	mkdir -p opt/Centrafuse_$pkgver/RadioModules
	mkdir -p opt/Centrafuse_$pkgver/Visuals
	mkdir -p usr/share/Centrafuse/CentrafuseAuto/Default/Plugins
	mkdir -p usr/share/Centrafuse/CentrafuseAuto/Default/RadioModules
	
	mkdir -p $pkgdir/opt/centrafuseauto
	cp -r usr $pkgdir/
	cp -r opt/Centrafuse_$pkgver/* $pkgdir/opt/centrafuseauto/

	chown -R root:root $pkgdir/opt/centrafuseauto
	chown -R root:root $pkgdir/usr/share/Centrafuse
	chown -R root:root $pkgdir/usr/local/bin/centrafuseauto
	chown -R root:root $pkgdir/usr/share/fonts/truetype/utsaah

	# Set directory permissions
	chmod 755 $pkgdir/opt/centrafuseauto
	chmod 755 $pkgdir/usr/share/Centrafuse
	chmod 755 $pkgdir/usr/share/fonts/truetype/utsaah

	# Set directory permissions
	find $pkgdir/opt/centrafuseauto -type d -exec chmod 755 {} \;
	find $pkgdir/usr/share/Centrafuse -type d -exec chmod 755 {} \;
	find $pkgdir/usr/share/fonts/truetype/utsaah -type d -exec chmod 755 {} \;

	# Set directory write permissions
	find $pkgdir/opt/centrafuseauto/Plugins -type d -exec chmod 777 {} \;
	find $pkgdir/opt/centrafuseauto/RadioModules -type d -exec chmod 777 {} \;
	find $pkgdir/opt/centrafuseauto/Skins -type d -exec chmod 777 {} \;

	# Set generic permissions for all files
	find $pkgdir/opt/centrafuseauto -type f -exec chmod 666 {} \;
	find $pkgdir/usr/share/Centrafuse -type f -exec chmod 666 {} \;
	find $pkgdir/usr/share/fonts/truetype/utsaah -type f -exec chmod 666 {} \;

	# Set execute file permissions
	chmod 644 $pkgdir/usr/local/bin/centrafuseauto
	chmod a+x $pkgdir/opt/centrafuseauto/centrafuseauto
	chmod a+x $pkgdir/usr/local/bin/centrafuseauto
	find $pkgdir/opt/centrafuseauto -name "*.exe" -exec chmod a+x {} \;
	find $pkgdir/opt/centrafuseauto -name "*.dll" -exec chmod a+x {} \;
	
	# Fix launcher
	sed -i 's/${INSTALL_DIR}/mono \/opt\/centrafuseauto/' $pkgdir/usr/local/bin/centrafuseauto
	sed -i 's/${INSTALL_DIR}/mono \/opt\/centrafuseauto/' $pkgdir/opt/centrafuseauto/centrafuseauto
}

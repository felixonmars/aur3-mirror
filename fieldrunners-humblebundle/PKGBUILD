# Maintainer: icoz <icoz.vt at gmail dot com>
pkgname=fieldrunners-humblebundle
pkgver=1.0.0
pkgrel=11
pkgdesc="Tower defense game, HumbleBundle version"
arch=('i686' 'x86_64')
url="http://www.humblebundle.com/"
license=('custom')
groups=('humblebundle')
depends=('alsa-lib' 'freeglut' 'libgl' 'libvorbis')
PKGEXT='.pkg.tar'
source=("fieldrunners.desktop"
        "icon.png::https://humblepull-wolfire.netdna-ssl.com/misc/files/dd9d9ddcab/images/icons/fieldrunners_android_pc_soundtrack.png")
        #"frfix-2012-09-07.tar.bz2::http://www.subatomicstudios.com/forum/download/file.php?id=995")
md5sums=('cdcfa9d1ab520cee3066b8964baf507e'
         '2e56e6eedfb9c0b239f8d369d03193b9')
         #'75e559153920e4b443ba970d0636ee02')

#use_patch = 0 - none of patches is used
#use_patch = 1 - patch is used
_use_patch=0

_realname="fieldrunners"
if [ "${CARCH}" == "x86_64" ]; then
	source+=(hib://$_realname-linux-$pkgver-64bit-1346776333.tar.gz)
	md5sums+=('db2de07444fab347e4d757ec6e7dd08a')
else
	source+=(hib://$_realname-$pkgver-32bit-1346296515.tar.gz)
	md5sums+=('691f3ee0c441412e9a9a95cdb1bfb6f0')
fi

package() {
	#install all game files to /opt
	cd "$srcdir"/fieldrunners/fieldrunners
	install -d "$pkgdir"/opt/fieldrunners
	find -type f -exec install -Dm644 {} "$pkgdir"/opt/fieldrunners/{} \;
	chmod +x "$pkgdir"/opt/fieldrunners/Fieldrunners
	cd "$srcdir"

	#install game icon
	install -D -m644 ${srcdir}/icon.png ${pkgdir}/opt/fieldrunners/

	#install application shortcut
	install -d ${pkgdir}/usr/share/applications
	install -D -m644 ${srcdir}/fieldrunners.desktop ${pkgdir}/usr/share/applications/

	#install launcher
	install -d "$pkgdir"/usr/bin
	ln -s /opt/fieldrunners/Fieldrunners "$pkgdir"/usr/bin/fieldrunners

	#install patch
	if [ "${_use_patch}" == "1" ]; then
		install -D -m755 ${srcdir}/frfix-32.so.prebuilt ${pkgdir}/opt/fieldrunners/
		install -D -m755 ${srcdir}/frfix-64.so.prebuilt ${pkgdir}/opt/fieldrunners/
		install -D -m644 ${srcdir}/frfix.c ${pkgdir}/opt/fieldrunners/
		install -D -m755 ${srcdir}/build.sh ${pkgdir}/opt/fieldrunners/
		install -D -m755 ${srcdir}/launch.sh ${pkgdir}/opt/fieldrunners/
		cd ${pkgdir}/opt/fieldrunners/
		source build.sh
		cd -
		rm -rf ${pkgdir}/opt/fieldrunners/frfix-32.so.prebuilt
		rm -rf ${pkgdir}/opt/fieldrunners/frfix-64.so.prebuilt
		rm -rf ${pkgdir}/opt/fieldrunners/frfix.c
		rm -rf ${pkgdir}/opt/fieldrunners/build.sh
	fi
}

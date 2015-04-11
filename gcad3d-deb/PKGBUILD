# Contributer: giacomogiorgianni@gmail.com

pkgname=gcad3d-deb
name=gCAD3D
pkgver=2.22
pkgrel=1
pkgdesc="3D CAD-CAM application that features an integrated 3D OpenGL viewer"
arch=('i686' 'x86_64')
url="http://opendesktop.org/content/show.php/gCAD3D?content=88766"
license=('Freeware')
depends=('gtk2' 'gtk3' 'cairo' 'glu')
install="$name.install"
#makedepends=('')

if [ "${CARCH}" = 'x86_64' ]; then
    ARCH='64'
    md5sums=('e1e6f13beacd7d89155c4ef522db3570')
elif [ "${CARCH}" = 'i686' ]; then
    ARCH='-x86' 
    md5sums=('420d399a9795f3e0c2e6b9d99f0eef0a')
fi
source=("http://www.gcad3d.org/download/$name-$pkgver-Linux$ARCH.deb")

package() {
	cd ${startdir}/src
	tar -zxf ${startdir}/src/data.tar.gz 
	cp -rp usr $pkgdir
	#mv ${startdir}/src/usr ${startdir}/pkg/
	#cp -r ${startdir}/src/* ${startdir}/pkg/
	#ln -s "${pkgdir}/usr/lib/gCAD3D/binLinux$ARCH/xa_gui_gtk3.so" "${pkgdir}/usr/lib/gCAD3D/binLinux$ARCH/xa_gui.so"
	install -D -m644 "${srcdir}/usr/share/gcad3d/$name.desktop" "${pkgdir}/usr/share/applications/${name}.desktop"
	#rm -rf "$pkgdir/$pkgname"
}

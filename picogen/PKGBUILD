# Contributor: Thomas Mudrunka <harvie@@email..cz>
# You can also contact me on http://blog.harvie.cz/

pkgname=picogen
pkgver=0.3
pkgrel=1
pkgdesc="Free Terragen-like terrain generator and (monte-carlo method) ray tracer"
arch=(i686) #x86_64)
license=('GPL')
url="http://picogen.org/"
depends=('libnoise') #libtiff

_pkgarch=i386;
source=("http://picogen.googlecode.com/files/${pkgname}-${pkgver}-${_pkgarch}.tar.gz")
md5sums=('ffb1fc0653cb85b214d8e099574310ad')

build() {
  mkdir -p "${pkgdir}/opt/picogen/"
  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/lib/"

	cd ${srcdir}
	rm *.tar.gz
	cp -r * "${pkgdir}/opt/picogen/" || return 1
	strip "${pkgdir}/opt/picogen/"* 2>/dev/null || true

	cd "${pkgdir}/opt/picogen/"
	ln -s "/opt/picogen/picohelp" "${pkgdir}/usr/bin/picogen-help"
	for i in picogen-pure picogen-simplex picogen-quatsch-editor; do
		ln -s "/opt/picogen/${i}" "${pkgdir}/usr/bin/${i}" || return 1
		cat ${i} | sed -e 's/libnoise.so.0/libnoise.so\x00\x00/g' > ${i}.fix
		mv -f ${i}.fix ${i}
	done;

	chmod -R 755 "${pkgdir}/opt/picogen/"

	#Desktop Launcher
	mkdir -p ${pkgdir}/usr/share/applications

	echo "[Desktop Entry]
Encoding=UTF-8
Name=PicoGen Simplex
GenericName=PicoGen Simplex
Comment=Terragen-like terrain generator
Exec=/usr/bin/picogen-simplex
Icon=/opt/picogen/icons/simplexgui.png
StartupNotify=true
Terminal=false
Type=Application
Categories=Graphics;3DGraphics;RasterGraphics;" > ${pkgdir}/usr/share/applications/picogen-simplex.desktop

	echo "[Desktop Entry]
Encoding=UTF-8
Name=PicoGen Quatsch Editor
GenericName=PicoGen Quatsch Editor
Comment=Terragen-like terrain generator
Exec=/usr/bin/picogen-quatsch-editor
Icon=/opt/picogen/icons/quatsch-editor.png
StartupNotify=true
Terminal=false
Type=Application
Categories=Graphics;3DGraphics;RasterGraphics;" > ${pkgdir}/usr/share/applications/picogen-quatsch-editor.desktop

}

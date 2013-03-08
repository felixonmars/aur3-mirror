# Maintainer: Tetsumaki <http://goo.gl/YMBdA>

pkgname=ultracopier3
pkgver=0.3.1.0
pkgrel=1
pkgdesc="Advanced file copying tool, old version with qt4"
arch=('i686' 'x86_64')
url="http://ultracopier.first-world.info/"
license=('GPL3')
depends=('qt4')
makedepends=('qt4')
conflicts=('ultracopier')
#source=("http://files.first-world.info/ultracopier/${pkgver}/ultracopier-src-${pkgver}.tar.xz")
source=("http://ompldr.org/vaG9ueQ/ultracopier-src-0.3.1.0.tar.xz")
sha1sums=('52fce2f9cc9598bcda759fdeb1726f29b1f8ace0')

build() {
	cd "${srcdir}/ultracopier-src"

	find -name "Variable.h" -exec sed -i "s/#define ULTRACOPIER_VERSION_PORTABLE/\/\/#define ULTRACOPIER_VERSION_PORTABLE/g" {} \;
	find -name "Variable.h" -exec sed -i "s/\/\/#define ULTRACOPIER_DEBUG/#define ULTRACOPIER_DEBUG/g" {} \;
	find -name "Variable.h" -exec sed -i "s/\/\/#define ULTRACOPIER_PLUGIN_DEBUG/#define ULTRACOPIER_PLUGIN_DEBUG/g" {} \;
	find -name "Variable.h" -exec sed -i "s/\/\/#define ULTRACOPIER_PLUGIN_DEBUG_WINDOW/#define ULTRACOPIER_PLUGIN_DEBUG_WINDOW/g" {} \;

	case ${CARCH} in
		i686)
			find -name "informations.xml" -exec sed -i -r "s/<architecture>.*<\/architecture>/<architecture>linux-x86-pc<\/architecture>/g" {} \;
			;;
		x86_64)
			find -name "informations.xml" -exec sed -i -r "s/<architecture>.*<\/architecture>/<architecture>linux-x86_64-pc<\/architecture>/g" {} \;
			;;
	esac

	qmake-qt4 "ultracopier.pro"
	lrelease-qt4 -nounfinished -compress -removeidentical -silent "ultracopier.pro"
	make

	cd "plugins/CopyEngine/Ultracopier-0.3"
	qmake-qt4 "copyEngine.pro"
	lrelease-qt4 -nounfinished -compress -removeidentical -silent "copyEngine.pro"
	make

	cd "${srcdir}/ultracopier-src/plugins/Listener/catchcopy-v0002"
	qmake-qt4 "listener.pro"
	lrelease-qt4 -nounfinished -compress -removeidentical -silent "listener.pro"
	make

	cd "${srcdir}/ultracopier-src/plugins/SessionLoader/KDE4"
	qmake-qt4 "sessionLoader.pro"
	lrelease-qt4 -nounfinished -compress -removeidentical -silent "sessionLoader.pro"
	make

	cd "${srcdir}/ultracopier-src/plugins/Themes/Oxygen"
	qmake-qt4 "interface.pro"
	lrelease-qt4 -nounfinished -compress -removeidentical -silent "interface.pro"
	make
}

package(){
	cd "${srcdir}/ultracopier-src"

	install -Dm644 "resources/ultracopier.desktop" "${pkgdir}/usr/share/applications/ultracopier.desktop"
	install -Dm644 "resources/ultracopier-128x128.png" "${pkgdir}/usr/share/pixmaps/ultracopier.png"
	install -Dm755 "ultracopier" "${pkgdir}/usr/bin/ultracopier"

	install -Dm644 "plugins/CopyEngine/Ultracopier-0.3/informations.xml" "${pkgdir}/usr/share/ultracopier/CopyEngine/Ultracopier-0.3/informations.xml"
	install -Dm755 "plugins/CopyEngine/Ultracopier-0.3/libcopyEngine.so" "${pkgdir}/usr/share/ultracopier/CopyEngine/Ultracopier-0.3/libcopyEngine.so"

	install -Dm644 "plugins/Listener/catchcopy-v0002/informations.xml" "${pkgdir}/usr/share/ultracopier/Listener/catchcopy-v0002/informations.xml"
	install -Dm755 "plugins/Listener/catchcopy-v0002/liblistener.so" "${pkgdir}/usr/share/ultracopier/Listener/catchcopy-v0002/liblistener.so"

	install -Dm644 "plugins/SessionLoader/KDE4/informations.xml" "${pkgdir}/usr/share/ultracopier/SessionLoader/KDE4/informations.xml"
	install -Dm755 "plugins/SessionLoader/KDE4/libsessionLoader.so" "${pkgdir}/usr/share/ultracopier/SessionLoader/KDE4/libsessionLoader.so"

	install -Dm644 "plugins/Themes/Oxygen/informations.xml" "${pkgdir}/usr/share/ultracopier/Themes/Oxygen/informations.xml"
	install -Dm755 "plugins/Themes/Oxygen/libinterface.so" "${pkgdir}/usr/share/ultracopier/Themes/Oxygen/libinterface.so"

	find -iname "*.ts" -exec rm {} \;

	for Z in ar de el es fr hi id it ja ko nl no pl pt ru th tr zh; do
		install -Dm644 "plugins/Languages/${Z}/flag.png" "${pkgdir}/usr/share/ultracopier/Languages/${Z}/flag.png"
		install -Dm644 "plugins/Languages/${Z}/informations.xml" "${pkgdir}/usr/share/ultracopier/Languages/${Z}/informations.xml"
		install -Dm644 "plugins/Languages/${Z}/translation.qm" "${pkgdir}/usr/share/ultracopier/Languages/${Z}/translation.qm"
		install -Dm644 "plugins/CopyEngine/Ultracopier-0.3/Languages/${Z}/translation.qm" "${pkgdir}/usr/share/ultracopier/CopyEngine/Ultracopier-0.3/Languages/${Z}/translation.qm"
		install -Dm644 "plugins/Themes/Oxygen/Languages/${Z}/translation.qm" "${pkgdir}/usr/share/ultracopier/Themes/Oxygen/Languages/${Z}/translation.qm"
	done
}

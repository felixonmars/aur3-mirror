# Maintainer: Daniel Spies <daniel dot spies at fuceekay dot com>

pkgname=fakturama
pkgver=1.6.7
_filever=1_6_7
pkgrel=1
pkgdesc="Free and Open Source Invoicing Software"
arch=('x86_64' 'i686')
url="http://fakturama.sebulli.com/"
license=('EPL')
provides=()
conflicts=()
depends=('java-environment' 'libxext' 'libxrender' 'fontconfig')
optdepends=('libreoffice-writer: office integration')
makedepends=()

if [ "$CARCH" = "x86_64" ]; then
	source=("http://downloads.sourceforge.net/project/fakturama/${pkgver}/Fakturama_Linux_64Bit_${_filever}.deb")
	sha256sums=("2e6b4e1bb83b02ceee6063dc592b3667d7f617e24d3da97df3d26717245940f9")
elif [ "$CARCH" = "i686" ]; then
	source=("http://downloads.sourceforge.net/project/fakturama/${pkgver}/Fakturama_Linux_32Bit_${_filever}.deb")
	sha256sums=("853e0393c2f30f9208d0d2f0cf5cb1093ec38e60854337eb092310c7379dc669")
fi

install=fakturama.install

prepare() {
	tar -jxvf data.tar.bz2

	# https://fakturama.atlassian.net/browse/FAK-261?focusedCommentId=11204&page=com.atlassian.jira.plugin.system.issuetabpanels:comment-tabpanel#comment-11204
	cd ${srcdir}/usr/share/Fakturama/configuration/
	grep -q -F 'org.eclipse.swt.browser.DefaultType=mozilla' config.ini || echo 'org.eclipse.swt.browser.DefaultType=mozilla' >> config.ini
}

package() {
	install -d -m755 ${pkgdir}/usr/share/pixmaps/
	install -d -m755 ${pkgdir}/usr/share/applications/
	install -d -m755 ${pkgdir}/usr/bin/

	declare -a dirs=("about_files" "configuration" "features" "p2" "plugins")
	for dir in "${dirs[@]}"
	do
		cp -drv --preserve=mode,timestamp ${srcdir}/usr/share/Fakturama/${dir} ${pkgdir}/usr/share/Fakturama/
	done

	declare -a files=("about.html" "artifacts.xml" "Fakturama.ini" "icon.xpm" "libcairo-swt.so")
	for file in "${files[@]}"
	do
		install -m644 ${srcdir}/usr/share/Fakturama/${file} ${pkgdir}/usr/share/Fakturama/
	done

	install -m755 ${srcdir}/usr/share/Fakturama/Fakturama ${pkgdir}/usr/share/Fakturama/

	install -m644 ${srcdir}/usr/share/Fakturama/pixmaps/Fakturama.png ${pkgdir}/usr/share/pixmaps/
	install -m644 ${srcdir}/usr/share/Fakturama/applications/fakturama.desktop ${pkgdir}/usr/share/applications/
	ln -s /usr/share/Fakturama/Fakturama ${pkgdir}/usr/bin/fakturama
}


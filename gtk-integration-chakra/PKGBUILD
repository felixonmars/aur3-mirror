#
# Packages for Chakra, part of chakra-project.org	
#
# maintainer (i686): Phil Miller <philm[at]chakra-project[dog]org>	
# maintainer (x86_64): Manuel Tortosa <manutortosa[at]chakra-project[dot]org>
pkgname=gtk-integration
pkgver=2.6
pkgrel=1
iconspkgver=2.5.0
widgetpkgver=1.0.5
_colors=3.0
cgcver=1.6
pkgdesc="A bundles and Gtk apps integration package for Chakra GNU/Linux"
arch=('i686' 'x86_64')
url=("http://www.nanolx.org/home/item/75-oxygen-refit http://kde-look.org/content/show.php/gtk-oxygen-engine?content=129715")
license=('LGPL3' 'GPL')
depends=('kdelibs' 'qt' 'oxygen-icons' 'cairo')
makedepends=('gcc' 'cmake' 'findutils' 'imagemagick' 'liblqr' 'gtk2')
provides=('gtk-integration' 'oxygenrefit2-icon-theme' 'oxygen-gtk' 'chakra-gtk-config')
conflicts=('oxygenrefit2-icon-theme' 'oxygen-gtk')
source=("http://download.tuxfamily.org/oxygenrefit2/oxygen-refit-2-$iconspkgver.tar.bz2"
        "ftp://ftp.caliu.cat/pub/mirrors/kde/stable/oxygen-gtk/$widgetpkgver/src/oxygen-gtk-$widgetpkgver.tar.bz2"
	"http://chakra-project.org/sources/gtk-integration/chakra-gtk-config-${cgcver}.tar.gz")
md5sums=('60f32f98d8d33d82db79b6bb934f0580'
         '4a30da4b5442d896c054cfcae783248e'
         'd924ec89729cd00e31d48b888e8e2324')
function create_install() {
cat > "${startdir}/${pkgname}.install" <<EOF
post_install() {
	cat <<-'EOF'
GTK - Integration v$pkgver-$pkgrel
You can install aditional engines:
----------------------------------
gtk-integration-engine-molecule
gtk-integration-engine-qtcurve
	EOF
}	
post_upgrade() {	
	post_install \$1
}	
op=\$1	
shift
\$op \$*
EOF
}		
function build() {
	# Icon theme
	cd ${srcdir}
	install -d ${pkgdir}/usr/share/icons/
	cp -rf "oxygen-refit-2-${iconspkgver}" ${pkgdir}/usr/share/icons/ || return 1
	mv "oxygen-refit-2-${iconspkgver}" "oxygen-refit-2"
	find -type f -print0 | xargs -0 chmod 644
        # Widget theme
	cd $srcdir/oxygen-gtk-$widgetpkgver
	rm -rf build
	mkdir build && cd build
	cmake -DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_SKIP_RPATH=ON \
	-DCMAKE_INSTALL_PREFIX=/usr .. || return 1
	make || return 1
	make DESTDIR=${pkgdir} install
	# Chakra-Gtk-Config
	cd ${srcdir}/chakra-gtk-config-${cgcver}
	rm -rf build
	mkdir build && cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr .. || return 1
	make || return 1
	make DESTDIR=${pkgdir} install
	# Create the install file
	create_install
	export install="${pkgname}.install"
}
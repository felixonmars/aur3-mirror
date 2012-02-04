# Shienkov Denis aka Kuzulis <scapig2@yandex.ru>
# This PKGBUILD is used to build the package Open Scada for OS ArchLinux. Currently supported assembly for i686 and x86_64

pkgname=openscada-svn
pkgver=1028
pkgrel=1
pkgdesc="OpenSCADA system is open implementation SCADA systems."
arch=('i686' 'x86_64')
url="http://oscada.diyaorg.dp.ua/"
license=('GPL')
depends=('gettext' 'gd' 'expat' 'mysql' 'sqlite3' 'openssl' 'bison' 'net-snmp' 'lm_sensors' 'portaudio' 'fftw' 'qt')
makedepends=('automoc4' 'automake' 'autoconf' 'libtool' 'make' 'gcc' 'gcc-libs' 'glibc' 'libgcrypt' 'subversion' 'pkgtools' 'pkgconfig')
provides=('openscada')
conflicts=('openscada')

source=()
md5sums=()

_svntrunk=svn://oscada.org.ua/trunk/OpenSCADA
_svnmod=OpenSCADA

build() {
cd "${srcdir}"

svn co $_svntrunk $_svnmod

msg "SVN checkout done or server timeout"

msg "Copy $_svnmod to $_svnmod-build"
cp -r $_svnmod $_svnmod-build
cd $_svnmod-build

msg "Configure for global build ..."

autoreconf -iv
./configure             \
  --prefix=/usr		    \
  --disable-FireBird

msg "Starting make..."
make VERBOSE=1 || return 1
make DESTDIR="${pkgdir}" install || return 1

msg "Copyng additional data and config files..."
install -m 777 -d "${pkgdir}"/var/spool/openscada/{DATA,icons,DEMO}
install -m 777 -d "${pkgdir}"/var/spool/openscada/ARCHIVES/{MESS,VAL}
install -m 644 -D data/oscada.xml "${pkgdir}"/etc/oscada.xml
install -m 644 -D data/oscada_start.xml "${pkgdir}"/etc/oscada_start.xml
install -m 755 -D data/openscada_start "${pkgdir}"/usr/bin/openscada_start
install -m 644 -D data/openscada.desktop "${pkgdir}"/usr/share/applications/openscada.desktop
install -m 644 -D data/openscada.png "${pkgdir}"/usr/share/icons/hicolor/64x64/apps/openscada.png
install -m 755 -D ../../oscadad "${pkgdir}"/etc/rc.d/oscadad
echo "OpenSCADA data dir" > "${pkgdir}"/var/spool/openscada/DATA/.info
install -m 644 data/icons/* "${pkgdir}"/var/spool/openscada/icons
echo "OpenSCADA messages archive dir" > "${pkgdir}"/var/spool/openscada/ARCHIVES/MESS/.info
echo "OpenSCADA values archive dir" > "${pkgdir}"/var/spool/openscada/ARCHIVES/VAL/.info
install -m 644 -D demo/oscada_demo.xml "${pkgdir}"/etc/oscada_demo.xml
install -m 755 -D demo/openscada_demo "${pkgdir}"/usr/bin/openscada_demo
install -m 644 -D demo/openscada_demo.desktop "${pkgdir}"/usr/share/applications/openscada_demo.desktop
install -m 644 -D demo/openscada_demo.png "${pkgdir}"/usr/share/icons/hicolor/64x64/apps/openscada_demo.png
install -m 644 demo/*.db "${pkgdir}"/var/spool/openscada/DEMO

msg "Remove $_svnmod-build..."
rm -rf ${srcdir}/$_svnmod-build
}

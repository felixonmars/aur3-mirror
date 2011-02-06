# Contributor: Lexiw <llexiw@gmail.com>
# Contributor: Jeremy Sands <cto@jeremysands.com>

pkgname=initscripts-splashy
pkgver=2009.08
pkgrel=1
pkgdesc="System initialization/bootup scripts with splash support"
arch=('i686' 'x86_64')
url="http://www.archlinux.org"
license=('GPL')
groups=('base')
backup=(etc/inittab etc/rc.conf etc/rc.local etc/rc.local.shutdown)
depends=('glibc' 'bash' 'awk' 'grep' 'coreutils' 'sed' 'udev>=118' 'net-tools' 'ncurses' 'sysvinit-mod')
provides=('initscripts')
conflicts=('initscripts')
install=initscripts-splash.install
source=(ftp://ftp.archlinux.org/other/initscripts/initscripts-${pkgver}-${pkgrel}.tar.gz
	splash.conf
	splash)
md5sums=('9a36513faa316ea5d5f74b9345fe3fa6'
         'fe6da7a9242aca91779e165979bb7e3d'
         'd3fffe7133e6096937195084d2746889')

build() {
  cd ${startdir}/src/initscripts-${pkgver}-${pkgrel}/

  DESTDIR=$startdir/pkg ./install.sh

  install -D -m644 ${startdir}/splash ${startdir}/pkg/etc/rc.d/functions.d/splash
  install -D -m644 ${startdir}/splash.conf ${startdir}/pkg/etc/splash.conf
}

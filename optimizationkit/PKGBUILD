# teZeriusz <t0@czlug.icis.pcz.pl>
pkgname=optimizationkit
pkgver=0.1.1
pkgrel=2
pkgdesc="OptimizationKit is tool (daemon) for making optimal work of Linux, according to
parameters given in the configuration file. It allows to chagne CFS, CFQ,
Deadline and Aticipatory scheduling parameters for task depending on configuration." #toolong?
url="http://optimizationkit.org"
license="GPL"
depends=(python pygtk)
makedepends=()
conflicts=()
replaces=()
backup=()
arch=(i686)
install=('OptimizationKit.install')
#?x64
source=(http://download.tuxfamily.org/optimization/OptimizationKit/v0.1/OptimizationKit-$pkgver.tar.bz2 optimizationkit OptimizationKit.install)

build() {
  cd $startdir/src/OptimizationKit-$pkgver

_SRCDIR=$startdir/src/OptimizationKit-$pkgver
_PREFIX=$startdir/pkg/usr
_BINDIR=$_PREFIX/bin
_SBINDIR=$_PREFIX/sbin
_DATADIR=$_PREFIX/share/OptimizationKit
_DESTDIR=$startdir/pkg
_RCDIR=$_DESTDIR/etc/rc.d
_CONFDIR=$_DESTDIR/etc/OptimizationKit


mkdir -p $_PREFIX
mkdir -p $_DATADIR
mkdir -p $_CONFDIR
mkdir -p $_BINDIR
mkdir -p $_SBINDIR
mkdir -p $_RCDIR

install -o root -g root -p -m744 $_SRCDIR/src/OptimizationKit $_DATADIR
install -o root -g root -p -m755 $_SRCDIR/src/OptimizationKit-gui $_DATADIR
install -o root -g root -p -m755 $_SRCDIR/src/ok_gen_prefetch_file $_DATADIR
install -o root -g root -p -m644 $_SRCDIR/src/ok_cfp.py $_DATADIR
install -o root -g root -p -m644 $_SRCDIR/src/ok_lib.py $_DATADIR
install -o root -g root -p -m644 $_SRCDIR/src/ok_srv.py $_DATADIR
install -o root -g root -p -m644 $_SRCDIR/src/ok_cg.py $_DATADIR
install -o root -g root -p -m644 $_SRCDIR/src/ok_opt.py $_DATADIR
install -o root -g root -p -m644 $_SRCDIR/src/ok_prefetch.py $_DATADIR

install -o root -g root -p -m644 $_SRCDIR/src/ok_mode_0.py $_DATADIR
install -o root -g root -p -m644 $_SRCDIR/src/ok_mode_1.py $_DATADIR
install -o root -g root -p -m644 $_SRCDIR/src/ok_mode_2.py $_DATADIR
install -o root -g root -p -m644 $_SRCDIR/src/ok_mode_3.py $_DATADIR
install -o root -g root -p -m644 $_SRCDIR/src/ok_mode_4.py $_DATADIR

install -o root -g root -p -m644 $_SRCDIR/conf/OptimizationKit.conf $_CONFDIR
install -o root -g root -p -m755 $startdir/optimizationkit $_RCDIR

#ln -s -f $_DATADIR/OptimizationKit $_SBINDIR/OptimizationKit
#ln -s -f $_DATADIR/OptimizationKit-gui $_BINDIR/OptimizationKit-gui
#ln -s -f $_DATADIR/ok_gen_prefetch_file $_BINDIR/ok_gen_prefetch_file

#if [ -f $_CONFDIR/OptimizationKit.conf ]
#	then
#		install -p -m644 $_SRCDIR/conf/OptimizationKit.conf $_CONFDIR/OptimizationKit.conf-new
#	else
#		install -p -m644 $_SRCDIR/conf/OptimizationKit.conf $_CONFDIR
#fi

}
md5sums=('2ae0a09dd66a9c06ed96d2f1ef1ac702'
         '54e5da67869ab8560e82a244b3fab678'
         '22372b58acd2e1be2b9d9688b0faa9e7')


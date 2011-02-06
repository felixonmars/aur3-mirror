pkgname=kde3-kgtk
pkgver=0.10.1
pkgrel=1
pkgdesc="LD_PRELOAD hack with helper scripts to make gtk and qt-only programs use KDE file dialogs."
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php?content=36077"
license=('GPL')
depends=('kdelibs3' 'qt3')
makedepends=('pkgconfig' 'automoc4' 'cmake' 'gettext')
install=kgtk.install
source=(http://home.freeuk.com/cpdrummond/KGtk-${pkgver}.tar.bz2 kfmclient const.patch)
md5sums=('b456046727f0120734410573d75c47e0'
	 '6fdecfadd501a388aeb9ad5efa442b01'
	 '40b1ff8b469af58a8664b8197902343d')

build() {
	cd $srcdir/KGtk-${pkgver}

	patch -Np1 -i ../const.patch || return 1

	for f in */*-wrapper.cmake; do sed -i 's|LD_PRELOAD=@CMAKE_INSTALL_PREFIX@/lib/kgtk/lib|LD_PRELOAD=@CMAKE_INSTALL_PREFIX@/lib@LIB_SUFFIX@/kgtk/lib|' ${f}; done

	mkdir -p $srcdir/build3

	cd $srcdir/build3
	export PATH=/opt/kde/bin:/opt/qt/bin:$PATH
	export QTDIR=/opt/qt
	export KDEDIR=/opt/kde

	cmake ../KGtk-${pkgver} -DCMAKE_INSTALL_PREFIX=/opt/kde -DKGTK_KDE3=true -DKGTK_GTK2=true -DKGTK_QT3=true || return 1
	make || return 1
	make DESTDIR=$pkgdir install || return 1
	make clean

	cd $srcdir
	mkdir -p $pkgdir/opt/kde/lib/kgtk || return 1
	cp kfmclient $pkgdir/opt/kde/lib/kgtk/kfmclient || return 1
	chmod +x $pkgdir/opt/kde/lib/kgtk/kfmclient || return 1

	sed -i 's#LD_PRELOAD=#PATH="/opt/kde/lib/kgtk:$PATH"; LD_PRELOAD=#' $pkgdir/opt/kde/bin/kqt3-wrapper

	rm -rf $srcdir/build3
}

#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=nemo-nutstore
pkgver=0.2.3
pkgrel=2
pkgdesc='NutStore plugin for Nemo-fm.'
arch=(i686 x86_64)
url='https://jianguoyun.com/'
license=(GPL2)
depends=('glib2' 'gtk2' 'nemo-fm')
makedepends=('automake')
optdepends=('nutstore: NutStore client' 'java-runtime' )
options=('!libtool' '!emptydirs')
install='nemo-nutstore.install'
source=("https://jianguoyun.com/static/exe/installer/nutstore_linux_src_installer.tar.gz")

build()
{
    cd $srcdir/nutstore_linux_src_installer
	rename nautilus "nemo" src/nautilus*
	sed -i "s/nautilus/nemo/g" configure configure.in src/*
	sed -i "s/Nautilus/Nemo/g" configure configure.in src/*
	sed -i "s/NAUTILUS/NEMO/g" configure configure.in src/*
	sed -i "s|NEMO_REQUIRED=2.0.0|NEMO_REQUIRED=1.0.0|g" configure configure.in
    ./configure --disable-static || return 1
    make || return 1
}

package()
{
    cd $srcdir/nutstore_linux_src_installer
    make DESTDIR=$pkgdir install
    rm -rf $pkgdir/usr/share/icons/hicolor/64x64/apps/
}
md5sums=('c1bfd97b3b8cf692dc4f9b6708d798f0')

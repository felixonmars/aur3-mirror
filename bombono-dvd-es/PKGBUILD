# Maintainer: Carlos Sanchez <cargabsj175@vegnux.org.ve>


pkgname=bombono-dvd-es
pkgver=0.7.0
pkgrel=1
pkgdesc="Bombono DVD is a DVD authoring program for Linux. It is made easy to use and has nice and clean GUI (Gtk)."
arch=('i686' 'x86_64')
url="http://bombono.org/"
license=('GPL')
depends=('gtk2' 'gtkmm' 'mjpegtools' 'libdvdread' 'dvdauthor' 'dvd+rw-tools' 'twolame' 'libxml++')
install=$pkgname.install
makedepends=('scons' 'gettext' 'boost')
provides=('bombono-dvd')
conflicts=('bombono-dvd' 'bombono-dvd-git')
source=("http://sourceforge.net/projects/bombono/files/bombono-dvd/0.7/bombono-dvd-0.7.0.tar.bz2/download"
        'bombono-dvd-0.7.0.es.po')
md5sums=('5a3569a22843dd2ece462b3ee5c49717'
         '2c6913c3ce39e3a9019eb7194aeb561f')


build (){
  cd $startdir/src/bombono-dvd-$pkgver

		scons PREFIX="/usr" DESTDIR="${pkgdir}" || return 1
		
		scons PREFIX="/usr" DESTDIR="${pkgdir}" install || return 1

	#installing spanish locale
	cp -r ${srcdir}/bombono-dvd-0.7.0.es.po /tmp
}

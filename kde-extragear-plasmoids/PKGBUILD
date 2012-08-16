# Contributor: Bartek Iwaniec <hash87 [at] gmail [dot] com>

pkgname=kde-extragear-plasmoids
arch=(i686 x86_64)
pkgver=4.9
pkgrel=1
pkgdesc="Additional Plasmoids from kde-look.org"
url="http://www.kde-look.org/"
license="GPL"
depends=('kdebase-workspace>=4.9.0' 'qjson' 'libpcap')
makedepends=('cmake' 'gcc' 'automoc4' 'gettext' 'boost')
source=(
	http://kde-look.org/CONTENT/content-files/134442-plasma-widget-quickaccess-0.8.2-2.zip
	http://litc.gildiarpg.pl/downloads/wifi-signal.tar.gz
	http://kde-look.org/CONTENT/content-files/91009-iHateTheCashew-4.4.tbz
	http://kde-look.org/CONTENT/content-files/92825-adjustableclock-3.0.tar.bz2
	http://kde-look.org/CONTENT/content-files/109367-yasp-scripted-1.0.8a.tar.bz2
	http://kde-look.org/CONTENT/content-files/99737-fancytasks-1.1.2.tar.bz2
	http://kent.dl.sourceforge.net/project/yawp/yawp/0.4.3/yawp-0.4.3.tar.bz2
	http://ivplasma.googlecode.com/files/toggle-compositing-0.2.3.tar.gz
	http://kde-look.org/CONTENT/content-files/97511-translatoid-1.30.tar.gz
	http://www.kde-look.org/CONTENT/content-files/92309-0.2-beta1.tar.bz2
	http://kde-look.org/CONTENT/content-files/98925-cwp-1.6.2.tar.bz2
	http://beonis.fr/smooth-tasks-v2012-02-19.tar.gz
	http://cdlszm.org/downloads/plasma-applet-daisy-0.0.4.26.tar.gz
	http://www.kde-look.org/CONTENT/content-files/91495-runcommand-2.2.tar.bz2
	http://socket-sentry.googlecode.com/files/socketsentry-0.9.3.tar.gz
	http://kde-look.org/CONTENT/content-files/107779-plasmoid-eventlist-0.5.95.tar.bz2
	http://kde-look.org/CONTENT/content-files/127019-playwolf-elements-0.2.2.tar.bz2
	http://kde-look.org/CONTENT/content-files/127462-fastuserswitch-0.3.2.tar.bz2
	http://kde-look.org/CONTENT/content-files/148508-activitymanager-wheeled-0.6.2.tar.gz
)
md5sums=('4879aa3af6d7db8e06dd8ed0ad994a51'
         '5c147b8c4c98043559716ae070bc06f2'
         '521952f888a4fe8a72969a586743c4b6'
         'cfe84573db8814edbfec5bcf8a29f4ee'
         'b271abb634b6310ce7853a479ee682b0'
         '0ffe30331739972d88126dd828c0ea22'
         '02af5ff62c5b05a9db034bae6c5f72c2'
         'c811dd4d9842d1628b748e01855357b5'
         '7f5e2c4d11756da3b0fa9c80076426df'
         'df2624396c2838457b866483dfbf9265'
         'a05028a20e0075785ffbbf68b856805e'
         '87c42e5e4be82bf57745e958f049a1f0'
         '43c1ae617a0216e0780187db8e628cdf'
         '1af09c59f3cba642db36871fb9cd340a'
         'b737c58ccf79d63bf15c87d99728518a'
         '199c8c6d534a0eec0ec1b20881b6fe8d'
         'd2c8c95ba7774dc1ac90c0c62540b064'
         '107124d564564d01a4b00709fb9dcc2a'
         '8a44996979a19223ba8066bf28220050')


build() {
#Build plasmoids
cd $srcdir
for _plasmoid_dir in *
do
   if [ -d $_plasmoid_dir ]; then
       if [ -f $_plasmoid_dir/CMakeLists.txt ]; then
	 cd $_plasmoid_dir
	 if [ $_plasmoid_dir != $srcdir ]; then
	    make_plasmoid
	    cd $srcdir
	 fi
       fi
   fi
done

#Remove conflicting files
rm ${pkgdir}/usr/share/apps/cmake/modules/FindQJSON.cmake
}



make_plasmoid() {
	if [ ! -d build  ]; then
		mkdir build
	fi
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DCMAKE_BUILD_TYPE=Release ..
	make clean
	make
        make DESTDIR=$pkgdir install
}


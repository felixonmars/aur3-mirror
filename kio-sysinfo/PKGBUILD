# Contributor: Shaika-Dzari <shaikadzari@gmail.com>
#Contributor : Atilla ÖNTAŞ <atilla_ontas@hotmail.com>

pkgname=kio-sysinfo
pkgver=1.8.2
pkgrel=4
pkgdesc="kio slave to display system infomation in konqueror."
url="http://jerrad.tuxfamily.org/kiosysinfo_eng.html"
license="GPL"
depends=('kdelibs' 'hwinfo')
makedepends=('pkgconfig')
arch=('i686' 'x86_64')
source=(http://download.tuxfamily.org/kiosysinfo/Sources/$pkgname-$pkgver.tar.gz
        'background.png' 'kio-sysinfo-1.8.2-suse-10.3.patch' 'archlinux.patch' 'sysinfo.png' 'cpu.png')
md5sums=('c64bfb10a6ecfef5953e78d8a8fb3b43'
		    'ecd475fa0a438adf7eb894ee19c3d0b7'
		    '0d1144e1591dc69150d75cbb52e923e9'
		    'f8c6a8932ab9fb74cde4b0c33f575d8b'
		    '7bc43781f4e8a068ebef8b3e18b43829'
		    '0556004d540c706d70352d88227f1d13')

build() {
  cd $startdir/src/$pkgname-$pkgver

#Patch for compability for KDE 3.5.9 from Suse 
  patch -Np1 -i $startdir/src/kio-sysinfo-1.8.2-suse-10.3.patch
  patch -Np1 -i $startdir/src/archlinux.patch

  ./configure

  # patching libhd option
  # sed -i -e "s/-lGL/-lhd -lGL/" src/Makefile

  make
  make DESTDIR=$startdir/pkg install
  cp $startdir/src/background.png $startdir/pkg/opt/kde/share/apps/sysinfo/about/images/background.png
  cp $startdir/src/sysinfo.png $startdir/pkg/opt/kde/share/apps/sysinfo/about/images/sysinfo.png
  cp $startdir/src/cpu.png $startdir/pkg/opt/kde/share/apps/sysinfo/about/images/cpu.png
}

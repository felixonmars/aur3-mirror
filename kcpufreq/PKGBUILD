# Contributor: Andrea Zucchelli <zukka77@gmail.com>
pkgname=kcpufreq
pkgver=0.3
pkgrel=1
pkgdesc="A KDE 3.x panel applet that displays the current CPU frequency"
arch=('i686' 'x86_64')

url="http://www.schaffert.eu/"
license=('GPL')
depends=('cpufrequtils' 'kdelibs')
source=(http://www.schaffert.eu/download/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('3b9670c79a7cf62ec4ae4a8b211cb194')
build() {
  cd $startdir/src/$pkgname
  if [ -f /etc/profile.d/qt3.sh ];then
	  . /etc/profile.d/qt3.sh
  else
	  return 1
  fi
  ./configure 
  make || return 1
  make DESTDIR=$startdir/pkg install
}

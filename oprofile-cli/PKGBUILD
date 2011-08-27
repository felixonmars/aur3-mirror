# Contributor: sujith_m82 <m.sujith@gmail.com>
# Original PKGBUILD in 'extra' repository. This is a non-QT version.
# Maintainer: Lucas De Marchi <lucas.de.marchi@gmail.com>

pkgname=oprofile-cli
pkgver=0.9.6
pkgrel=1
pkgdesc="a system-wide profiler for Linux systems, capable of profiling all running code at low overhead."
arch=(i686 x86_64)
url="http://oprofile.sourceforge.net"
license="GPL"
depends=(popt gcc)
source=(http://downloads.sourceforge.net/sourceforge/oprofile/oprofile-$pkgver.tar.gz \
        oprofile oprofile.conf)
build()
{
  cd $startdir/src/oprofile-$pkgver
  ./configure --prefix=/usr --with-kernel-support
  make || return 1
  make DESTDIR=$startdir/pkg install

  mkdir -p $startdir/pkg/etc/rc.d/
  install -m755 $startdir/src/oprofile $startdir/pkg/etc/rc.d/
  mkdir -p $startdir/pkg/etc/conf.d/
  install -m755 $startdir/src/oprofile.conf $startdir/pkg/etc/conf.d/oprofile
}
md5sums=('4e407093ac06200185d5a5e6437d7242'
         'c17ea27694be82f73a735354352f3558'
         '58b5bfd606f9702a5616d6911757b77e')

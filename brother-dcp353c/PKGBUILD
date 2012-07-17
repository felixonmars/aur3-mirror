# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=brother-dcp353c
pkgver=1.0.1
pkgrel=1
pkgdesc="Brother DCP-353C CUPS driver"
arch=('x86_64')
url="http://solutions.brother.com/linux/en_us/index.html"
license=('custom:Brother Industries')
makedepends=('rpmextract')
install=brother-dcp353c.install
source=(brother-dcp353c.patch
        http://www.brother.com/pub/bsc/linux/dlf/dcp353clpr-1.0.1-1.i386.rpm
		http://www.brother.com/pub/bsc/linux/dlf/dcp353ccupswrapper-1.0.1-1.i386.rpm)
md5sums=('3cfcf1122da45af29a694e128a960296' 'e112ac9bc3f420f082625eb9df0b5b11' 'a309a9c06646789ded489b3b5fc63435')

build()
{
  cd $srcdir
  for i in *.rpm; do
    rpmextract.sh "$i" || return 1
  done

  patch -p0 < ../brother-dcp353c.patch || return 1

  $srcdir/usr/local/Brother/Printer/dcp353c/cupswrapper/cupswrapperdcp353c

  mkdir -p $pkgdir/usr/share
  cp -R $srcdir/usr/bin $pkgdir/usr
  cp -R $srcdir/usr/local/Brother/Printer/dcp353c $pkgdir/usr/share/brother

  rm $pkgdir/usr/share/brother/cupswrapper/cupswrapperdcp353c
  rm $pkgdir/usr/share/brother/inf/setupPrintcapij

  install -m 644 -D ppd_file $pkgdir/usr/share/cups/model/brdcp353c.ppd
  install -m 755 -D wrapper $pkgdir/usr/lib/cups/filter/brlpdwrapperdcp353c
}


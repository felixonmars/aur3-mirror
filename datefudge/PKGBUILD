#Contributor: Dan Serban (dserban01 => gmail)
pkgname=datefudge
pkgver=1.14
pkgrel=1
pkgdesc="Injects a user-specified date/time into the execution of an application so that it thinks the wall clock is different"
arch=('i686')
url="http://packages.debian.org/squeeze/datefudge"
license=('GPLv2')
depends=('glibc')
source=('http://mirrors.kernel.org/debian/pool/main/d/datefudge/datefudge_1.14_i386.deb')
md5sums=('fa9e17b0d72fd6e298d2236955ae39c7')

build()
{
  msg "Extracting ..."
  ar -xv datefudge_1.14_i386.deb || return 1
  tar -xvf data.tar.gz || return 1
  msg2 "Done extracting."
  msg "Moving files .."
  mv $srcdir/usr $pkgdir
  msg2 "Done moving files."
}

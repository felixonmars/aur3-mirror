# Contributor: Dan Serban

pkgname=fwfstab
pkgver=0.04
pkgrel=1
pkgdesc="A graphical file system table editor"
arch=(any)
url="http://www.diffingo.com/oss/fwfstab"
license=(GPLv2)
depends=(python2 pygtk)
#depends=(python2 pygtk pyparted usermode)
makedepends=(automake gettext intltool rpmextract)
source=(http://download.fedora.redhat.com/pub/fedora/linux/releases/14/Everything/source/SRPMS/fwfstab-0.04-0.2.rc1.fc14.src.rpm)
md5sums=('bb021b418f49ad1849c385cf12689578') 

build()
{
  cd $srcdir
  rpmextract.sh fwfstab-0.04-0.2.rc1.fc14.src.rpm
  bsdtar -xvf fwfstab-0.04rc1.tar.gz
  export PYTHON=/usr/bin/python2
  cd fwfstab-0.04rc1
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install
  rm -rf $pkgdir/usr/bin
  sed -i 's#/usr/share/local#/usr#' $pkgdir/usr/sbin/$pkgname
  sed -i 's/^python /python2 /' $pkgdir/usr/sbin/$pkgname
  sed -i 's/python$/python2/'   $pkgdir/usr/share/$pkgname/$pkgname-runapp.py
}

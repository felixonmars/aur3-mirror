# Maintainer: allspark <allspark (at) cyb0rg dot com>
pkgname=jabbin
pkgver='3.0b'
filename='3.0-beta'
pkgrel=0
pkgdesc="fork of Psi with Jingle support"
depends=('qt>=4.2.0' 'qca>=2.0' 'speex')
url="http://www.jabbin.com/"
source=(http://jabbin.svn.sourceforge.net/viewvc/jabbin/tags/$filename.tar.gz jabbin.patch)
md5sums=('6d0ea26182ef2c3b27b9d4839b3f2a3b' 'c1cdae256f0fe9bb32190f29a42e062b')
license=("GPL")
arch=('i686' 'x86_64')

build() {
   cd $startdir/src
   patch -p0 < jabbin.patch
   cd $filename
   chmod +x configure-jingle
   ./configure-jingle --prefix=/usr
   cd third-party/libjingle-0.4.0
   chmod +x configure
   ./configure --prefix=/usr
   qmake
   make || return 1

   cd ../jrtplib
   qmake
   make || return 1

   cd ../..
   make || return 1
   make INSTALL_ROOT=$startdir/pkg install
}

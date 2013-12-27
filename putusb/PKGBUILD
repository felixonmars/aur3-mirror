# Maintainer: lks <lukas .dot. graetz @at@ web .dot. de>
# Contributor: Ilya Petrov <ilya.muromec@gmail.com>

pkgname=putusb
pkgver=20131226
pkgrel=4
pkgdesc="Library and utility to comminicate with Motorola phones bootloaders"
arch=('any')
url="http://github.com/muromec/putusb/tree/master"
license=('GPL')
depends=('python2-pyusb')
makedepends=('git')
optdepends=('python2-pyqt4: For using qputusb.py')
provides=('qputusb')
replaces=('qputusb')
conflicts=('qputusb')
source=('setup.py'
	'http://people.openezx.org/muromec/putusb/gen-blob'
	'50-ezx-flash.rules')
md5sums=('3db8e59bf1f4424882d9c1e5c0ec076c'
	'5a38817e14a12dd757003f42f5f3c77c'
	'39cb4ed67ee89d57e97f9f1e6ca26eb6')


_gitroot="git://github.com/muromec/putusb.git"

prepare() {
  cd $srcdir
  msg "Connecting to GIT server...."
 
  if [[ -d $srcdir/$pkgname ]] ; then
    cd $pkgname
    git pull origin || return 1
    msg "The local files are updated."
  else
    git clone $_gitroot || return 1
  fi

  msg "GIT checkout done"
}

build() {
  mkdir -p $srcdir/$pkgname-build/build/lib/
  cd $srcdir/$pkgname-build
  cp $srcdir/$pkgname/$pkgname/$pkgname.py build/lib/

  echo "#!/usr/bin/python2" > qputusb
  cat $srcdir/$pkgname/$pkgname/qputusb.py >> qputusb
  echo "#!/usr/bin/python2" > qt-putusb
  cat $srcdir/$pkgname/$pkgname/qt-putusb.py >> qt-putusb
  echo "#!/usr/bin/python2" > nv
  cat $srcdir/$pkgname/$pkgname/nv.py >> nv

  cp $srcdir/setup.py setup.py

  #sed -i "s|python|python2|g" {qputusb,qt-putusb,nv}
  sed -i "s|from putusb import putusb|import putusb|g" {qputusb,qt-putusb,nv}
}

package() {
  cd $srcdir/$pkgname-build
  python2 setup.py install -f --root=$pkgdir

  install -d $pkgdir/usr/bin
  # all python2 scripts (working or not) will be in /usr/bin
  install -m 755 -t $pkgdir/usr/bin/ {qputusb,qt-putusb,nv}

  cd $srcdir
  install -d  $pkgdir/lib/firmware/ezx/
  install -t $pkgdir/lib/firmware/ezx/ gen-blob $pkgname/bin/{fastboot.stock,tegra_pre_boot}.bin
  install -d $pkgdir/etc/udev/rules.d
  install 50-ezx-flash.rules $pkgdir/etc/udev/rules.d/50-ezx-flash.rules
}

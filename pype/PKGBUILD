# Maintainer: David Scholl <djscholl at gmail dot com> 
pkgname=pype
pkgver=2.9.4
pkgrel=1
pkgdesc="A lightweight but powerful Python Programmers Editor"
arch=('any')
url="http://pype.sourceforge.net/index.shtml"
license=('GPL')
depends=('wxpython')
makedepends=('unzip')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/PyPE-${pkgver}-src.zip 
        pype.desktop pype)
md5sums=('ab0d259c99ff4e16aaeeaf64931fc131'
         'c430b7333a007ee809bdaa22de020f75'
         'ad77f30cc3dbca5e822fc50c3fc3b399')

build() {
  install -d $pkgdir/usr/bin
  cp $pkgname $pkgdir/usr/bin || return 1
  chmod a+x $pkgdir/usr/bin/$pkgname || return 1
  install -d $pkgdir/usr/share/applications
  cp pype.desktop $pkgdir/usr/share/applications
  cd $srcdir/PyPE-$pkgver
  install -d $pkgdir/opt/$pkgname
  cp -R * $pkgdir/opt/$pkgname || return 1
}

# Contributor: Smartboy <smartboyathome@gmail.com>
pkgname=prispy
pkgver=0.1a4
pkgrel=2
pkgdesc="A Mozilla Prism-like application based on PyGTK and Webkit."
arch=(any)
url="http://bbs.archlinux.org/viewtopic.php?id=96931"
license=('GPL')
depends=('pygtk' 'pywebkitgtk')
source=($pkgname)
md5sums=('05682a3d9768a4b1aaa895af0e4fefaa')

build() {
  cd $srcdir
  mkdir -p $pkgdir/usr/bin/
  cp prispy $pkgdir/usr/bin/
  chmod +x $pkgdir/usr/bin/
}

# vim:set ts=2 sw=2 et:

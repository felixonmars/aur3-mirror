# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=ng-xim
pkgver=1
pkgrel=1
pkgdesc=" Picture, video and sound viewer, manager and editor, HTML generator"
arch=(i686 x86_64)
url="http://www.sign-el-soft.hu/cgi/ng-xim.html"
license=('GPL')
source=(http://www.sign-el-soft.hu/cgi/${pkgname}.tar.gz)
md5sums=('ffedc92cb733b0176458e1bbb24c0ab6')

build() {
  install -d ${pkgdir}/usr/share/doc/ng-xim/
  install -Dm755 ${srcdir}/*.txt ${pkgdir}/usr/share/doc/ng-xim/ || return 1
  install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname} || return 1
  install -Dm755 ${srcdir}/ng-find ${pkgdir}/usr/bin/ng-find
}


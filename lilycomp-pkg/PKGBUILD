
# Maintainer: LaPingvino

pkgname=lilycomp-pkg
_pkgname=lilycomp
pkgver=1.0.2
pkgrel=2
pkgdesc="A graphical note entry program for use with the LilyPond music typesetting program. Doesn't try to install on build as the other package does."
arch=('i686' 'x86_64')
url="http://lilycomp.sourceforge.net/"
license=('GPL')
depends=('python' 'tk')
conflicts=('lilycomp')
provides=('lilycomp')
source=(http://sourceforge.net/projects/$_pkgname/files/$_pkgname/$pkgver/$_pkgname.$pkgver.tar.gz/download \
	'german.patch')
md5sums=('efd57e8ce909ea2a268c411e6b6ef30a'
         '986b815884c19231000a09e53c55f274')
package() {
  cd "$srcdir/$_pkgname.$pkgver"

  install -Dm755 lilycomp.py ${pkgdir}/usr/bin/${_pkgname}
  patch ${pkgdir}/usr/bin/${_pkgname} -i ${srcdir}/german.patch 
}

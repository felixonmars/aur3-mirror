# Contributor: Neel

pkgname=abby
pkgver=0.4.8
pkgrel=1
pkgdesc="A Qt4 front-end for cclive and clive that can be used to download videos from Youtube and similar video hosting services"
arch=('i686' 'x86_64')
url="http://$pkgname.googlecode.com/"
license=('GPL3')
depends=('cclive>=0.5.0' 'qt>=4.4')
optdepends=('clive>=4.4')
source=($url/files/$pkgname-$pkgver.tar.bz2)
md5sums=('22cfd98ea16a4f02640af5b0cadcaa91')

build() {
  cd $pkgname-$pkgver

 qmake "QT+=network xml"
  make || return 1
  install -Dm755 abby $pkgdir/usr/bin/abby
}

# vim:set ts=2 sw=2 et:
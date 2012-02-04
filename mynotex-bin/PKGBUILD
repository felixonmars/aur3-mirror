# Maintainer: Bartek Piotrowski <barthalion@gmail.com>
pkgname=mynotex-bin
pkgver=1.0.5
pkgrel=1
pkgdesc="MyNotex is a free note-taking and notes manager software for Linux. Binary version."
url="http://sites.google.com/site/mynotex"
license=('GPL')
arch=('i686' 'x86_64')
depends=('sqlite3')
source=(http://sites.google.com/site/mynotex/files/executable-mynotex_${pkgver}.tar.gz)
md5sums=('b811544b1063d8144a7a4de1602abb8b')

build() {
  install -D -m 775 mynotex $pkgdir/usr/bin/mynotex
}

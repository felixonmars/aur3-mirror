#Contributor: fancris3 <fancris3 at aol.com>

pkgname="kdeicons-pasodoble"
pkgver=0.1.20
pkgrel=4
pkgdesc="Icon theme based on Tango project"
url="http://www.jesusda.com/projects/pasodoble/"
license="Creative Commons"
arch=('i686' 'x86_64')
depends=('kdebase')
source=("http://www.jesusda.com/projects/pasodoble/pasodoble-alfa-$pkgver.tar.gz")
md5sums=('11bac01324ed4d43375352b14cf1db88')

build() {
  cd $startdir/src/
  mkdir -p $startdir/pkg/opt/kde/share/icons
  install -D -m644 pasodoble/license $startdir/pkg/usr/share/licenses/$pkgname/license
  cp -r pasodoble/ $startdir/pkg/opt/kde/share/icons/
  find $startdir/pkg/ -type f -print0 | xargs -0 chmod 664
}

# Contributor: H.Gökhan SARI <hsa2@difuzyon.net>
pkgname=bangarang-bin
pkgver=1.0
pkgrel=beta3
pkgdesc="Bangarang is a media player for KDE."
arch=('any')
url="http://opendesktop.org/content/show.php/Bangarang?content=113305"
license=('GPL')
depends=('kdelibs>=4.3' 'soprano' 'taglib>=1.5')
makedepends=('rpmextract')
source=('http://www.mandrivalinux.gr/rpm/2010.0/i586/bangarang-1.0.beta3-1mgr2010.0.i586.rpm')
noextract=('bangarang-1.0.beta3-1mgr2010.0.i586.rpm')
md5sums=('0eac7554897455c565e8a00efccfa11d')

build() {
  mkdir $srcdir/$pkgname/
  cd $srcdir/$pkgname/

  rpmextract.sh $srcdir/bangarang-1.0.beta3-1mgr2010.0.i586.rpm
  cp -R $srcdir/$pkgname/* $pkgdir
}

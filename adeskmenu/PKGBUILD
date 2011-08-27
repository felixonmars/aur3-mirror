# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=(adeskmenu)
pkgver=0.3.2
pkgrel=3
pkgdesc="A Quick Systray Application Launcher"
arch=('i686' 'x86_64')
url="http://www.ad-comp.be/"
license=('GPL')
depends=('pygtk' 'python2')
install=$pkgname.install
source=(${url}public/projets/adesk-menu/$pkgname-$pkgver.tar.bz2
        $pkgname.desktop
	$pkgname.patch)
md5sums=('63756fe60116864f5038f1828f0a86c8'
         '6dee76347462e5b392dd5b18d9924b6d'
         '86b82cac09355c5eb494b3d0ce38c727')

build() {
  cd $srcdir/$pkgname

  # Fix
  patch -Np1 -i ../$pkgname.patch

  # Python 2 Fix
  sed -i "s_\(python\)_env \12_" adeskmenu

  mkdir -p "$pkgdir"/usr/{bin,share/{$pkgname,applications,pixmaps}}

  cp -a * $pkgdir/usr/share/$pkgname
  install -Dm 644 images/$pkgname.png $pkgdir/usr/share/pixmaps
  install -Dm 644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications

  ln -s /usr/share/$pkgname/$pkgname $pkgdir/usr/bin
}

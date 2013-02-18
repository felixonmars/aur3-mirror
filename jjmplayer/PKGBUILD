# Maintainer: M4rQu1Nh0S <zonadomarquinhos@gmail.com>
pkgname=jjmplayer
pkgver=0.1
pkgrel=1
pkgdesc="(Just another Java MPlayer Frontend) is a java frontend for MPlayer aimed to be simple to use and also simple to port."
arch=(any)
url="http://jjmplayer.sourceforge.net/"
license=(GPL)
depends=('java-runtime' 'mplayer')
source=("http://sourceforge.net/projects/jjmplayer/files/jjmplayer/jjmplayer-0.1/$pkgname-$pkgver.zip" "$pkgname" "$pkgname.desktop")
md5sums=('657b22b6668b9ff90b7748a9498ef4ec'
         'a3e5f03cc55bf5cf2198203fcddf9f08'
         'a4210e9d9501c9f528d681771763c9bc')

package() {
  install -D "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -D "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -dm=775 "$pkgdir/usr/share/$pkgname/"
  cd "$srcdir/$pkgname-$pkgver/"
  cp -r * "$pkgdir/usr/share/$pkgname/"

}

# vim:set ts=2 sw=2 et:

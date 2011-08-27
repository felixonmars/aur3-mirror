# Contributor: xnitropl <xnitropl at gmail dot com>
pkgname=scum-of-the-universe
_pkgname=sotu
pkgver=1.0
pkgrel=2
pkgdesc="A space trading game that combines two genres: arcade and strategy."
url="http://www.guacosoft.com/scum/"
arch=('i686')
license=('GPL')
depends=('zlib' 'libpng' 'sdl' 'sdl_mixer' 'sdl_image' 'libstdc++5' 'libgl')
source=(http://www.guacosoft.com/scum/scum-1.0-i386.tar.gz
        $_pkgname.sh
        $_pkgname.desktop)
md5sums=('d9d93ce2b73c7c0e313e0617feaa3ed0'
         '249b1530733b0e35f4516a83f0b10432'
         '6dba1caaca96a244523dcf4d26a6ea48')

build() {
  install -d $pkgdir{/opt/$_pkgname,/usr/bin}

  cp -r $srcdir/scum-1.0-i386/* $pkgdir/opt/$_pkgname
  chmod 755 $pkgdir/opt/$_pkgname/bin/$_pkgname

  install -D -m755 $startdir/$_pkgname.sh $pkgdir/usr/bin/$_pkgname
  install -D -m644 $startdir/$_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop
}
# vim:set ts=2 sw=2 et:

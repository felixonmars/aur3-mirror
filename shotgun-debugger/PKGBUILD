# Contributor: xnitropl <xnitropl at gmail dot com>
pkgname=shotgun-debugger
pkgver=1.1
pkgrel=1
pkgdesc="A futuristic overhead action game."
url="http://www.msarnoff.org/sdb/"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('sdl' 'sdl_mixer' 'sdl_image' 'libstdc++5' 'libgl')
source=(http://www.msarnoff.org/sdb/$pkgname-$pkgver-src.zip
        limits.patch
        localstatedir.patch
        $pkgname.sh
        $pkgname.desktop)
md5sums=('13d4755b63762ef54040508946a7c375'
         'ccb9684750f2e4d1ec0f1f7ba14422d6'
         '097ae690acb76be4d155170a70af7751'
         'ab15c7c351a3ec47f0e32c1cf25531e1'
         '8b2a41e76da1224a8c49757d8723f601')

build() {
  cd $srcdir/ShotgunDebuggerSource
  patch -Np0 -i ../../limits.patch || return 1
  patch -Np0 -i ../../localstatedir.patch || return 1
  make clean all || return 1

  mkdir -p $pkgdir/usr/share/games/$pkgname/Resources
  cp -r $srcdir/ShotgunDebuggerSource/Resources/{levels,models,snd,sprites} $pkgdir/usr/share/games/$pkgname/Resources
  chmod -R 755 $pkgdir/usr/share/games/$pkgname

  cp $srcdir/ShotgunDebuggerSource/$pkgname $pkgdir/usr/share/games/$pkgname
  install -D -m755 $startdir/$pkgname.sh $pkgdir/usr/bin/$pkgname

  install -D -m644 $startdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
# vim:set ts=2 sw=2 et:

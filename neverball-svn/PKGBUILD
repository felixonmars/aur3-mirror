# Contributor: Anders Bergh <anders@archlinuxppc.org>
pkgname=neverball-svn
pkgver=3060
pkgrel=1
pkgdesc="Neverball and Neverputt. Ball-based games. SVN version"
arch=(i686 x86_64)
url="http://www.nevercorner.net/forum/"
license=('GPL')
depends=('sdl_image' 'sdl_ttf' 'sdl_mixer' 'libgl' 'physfs')
makedepends=('svn')
source=(neverball-svn.desktop
	neverball-svn.png
	neverball-svn
	neverputt-svn.desktop
	neverputt-svn.png
	neverputt-svn)
md5sums=('2e59745efb1534cd0f6a82163373e486'
         '641e993d13029b5abb8c4a1cd40750fa'
         'b92a46a5faf2508c29362e1feb8a2398'
         'd835af87d3c4901e260d8f3d6138f081'
         'df67293e4e7318d11ea85450e00be35a'
         'ce20a6ab55d99d7121ea4803df090d39')
_svntrunk=https://s.snth.net/svn/neverball/trunk
_svnmod=neverball

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  if [ -d $_svnmod-build ]; then
    rm -rf $_svnmod-build
  fi

  svn export $_svnmod $_svnmod-build
  cd $_svnmod-build

  [ "$CARCH" = "i686" ]   && sed -i 's/-O3/-O2 -march=i686   -mtune=generic -pipe/' Makefile
  [ "$CARCH" = "x86_64" ] && sed -i 's/-O3/-O3 -march=x86-64 -mtune=generic -pipe/' Makefile

  make || return 1

  install -Dm755 neverball $pkgdir/usr/share/neverball-svn/bin/neverball-svn
  install -Dm755 neverputt $pkgdir/usr/share/neverball-svn/bin/neverputt-svn
  install -Dm755 ../neverball-svn $pkgdir/usr/bin/neverball-svn
  install -Dm755 ../neverputt-svn $pkgdir/usr/bin/neverputt-svn
  install -Dm644 ../neverball-svn.desktop $pkgdir/usr/share/applications/neverball-svn.desktop
  install -Dm644 ../neverball-svn.png $pkgdir/usr/share/pixmaps/neverball-svn.png
  install -Dm644 ../neverputt-svn.desktop $pkgdir/usr/share/applications/neverputt-svn.desktop
  install -Dm644 ../neverputt-svn.png $pkgdir/usr/share/pixmaps/neverputt-svn.png
  cp -r data/ $pkgdir/usr/share/neverball-svn
  find ${startdir}/pkg/usr/share/neverball-svn/data -type f -exec chmod 644 {} \;
}

# vim:set ts=2 sw=2 et:

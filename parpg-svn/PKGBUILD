# Contributor: Chris Baker <baker.chris.3@gmail.com>
pkgname="parpg-svn"
provides="parpg"
pkgdesc="Post-Apocalyptic Roleplaying Game"
url="http://www.parpg.net/"
pkgver=513
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL3')
depends=('python' 'python-yaml' 'fife-svn>=3236')
makedepends=('subversion')
source=(parpg
        parpg.desktop
        parpg.png)
md5sums=('d2039fe702f20c18b063da83a8bc00e4'
         '65552e2b373bdf44d00564b5555b0fd0'
         '169fdfc1351e4338937fb5b70327a68b')
_svntrunk="http://parpg-svn.cvsdude.com/parpg/trunk/game/"
_svnmod=trunk

build() {
  cd $srcdir
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  
  mkdir -p $pkgdir/usr/lib/
  cp -r $_svnmod $pkgdir/usr/lib/parpg
  find $pkgdir/usr/lib/parpg -name .svn -type 'd' | xargs rm -rf
  python -c "import compileall; compileall.compile_dir('$pkgdir/usr/lib/parpg', force=1)"
  
  install -D -m666 $srcdir/$_svnmod/settings-dist.xml $pkgdir/usr/lib/parpg/settings.xml
  install -D -m755 $srcdir/parpg $pkgdir/usr/bin/parpg
  install -D -m644 $srcdir/parpg.png $pkgdir/usr/share/pixmaps/parpg.png
  install -D -m644 $srcdir/parpg.desktop $pkgdir/usr/share/applications/parpg.desktop
}


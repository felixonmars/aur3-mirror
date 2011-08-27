# Creator: Flamelab <panosfilip@gmail.com>

pkgname=i7z-svn
pkgver=20
pkgrel=1
pkgdesc="A better CLI i5/i7 reporting tool for Linux. Svn version." 
arch=('i686' 'x86_64')
url="http://code.google.com/p/i7z/"
license=('GPL2')
depends=('ncurses')
makedepends=('subversion')
install=(i7z-svn.install)

_svnmod="i7z"
_svntrunk=http://i7z.googlecode.com/svn/trunk/


build() 

{
     cd "${srcdir}"

     if [ -d $_svnmod/.svn ]; then
          (cd $_svnmod && svn up -r $pkgver)
     else
          svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
     fi

     msg "SVN checkout done or server timeout"
     msg "Starting make..."

     if [ -d $_svnmod-build ];then
        rm -r $_svnmod-build
     fi
     cp -r $_svnmod $_svnmod-build
     cd $_svnmod-build

     make || return 1
     install -Dm 755 i7z ${pkgdir}/usr/bin/i7z

#Still not found a way to build the GUI tool

}

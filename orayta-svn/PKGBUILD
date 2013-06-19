# Maintainer: Yoel Lion <yoel3ster at gmail dot com>

pkgname=orayta-svn
pkgver=645
pkgrel=1
pkgdesc="Jewish books program with Hebrew & French translations"
arch=('i686' 'x86_64')
license=('GPLv3')
url="http://code.google.com/p/orayta/"
depends=('fribidi' 'poppler-qt' 'qtwebkit')
makedepends=('subversion')
conflicts=('quazip')
optdepends=('ttf-dejavu: good for Hebrew fonts'
            'culmus: better for Hebrew fonts'
            'ttf-sbl-hebrew: a biblical Hebrew fonts'
            'ttf-sil-ezra: a another Hebrew fonts')
_svntrunk=http://orayta.googlecode.com/svn/trunk/
_svnmod=orayta
build() {
  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
svn co $_svntrunk $_svnmod
fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
cd $srcdir/$_svnmod
#sed -i '10,15d' Orayta.pro
qmake-qt4
make 
make INSTALL_ROOT=${pkgdir} install
rm -rf $srcdir/$_svnmod
}


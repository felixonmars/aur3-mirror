# Contributor: Otakar Haska <ota.haska@seznam.cz>

pkgname=texstudio-hg
pkgver=4886.693cb8e9a264
pkgrel=1
pkgdesc="TeXstudio is a fork of the LaTeX IDE TexMaker. Gives you an environment where you can easily create and manage LaTeX documents."
arch=('i686' 'x86_64')
url="http://texstudio.sourceforge.net"
license=('GPL')
makedepends=('mercurial' 'cmake')
depends=('qt4' 'poppler-qt')
conflicts=('texmakerx' 'texstudio' 'texstudio-svn')
source=(hg+http://hg.code.sf.net/p/texstudio/hg texstudio.desktop)
md5sums=('SKIP'
         '19d26b80320534ed50f318e2abb26ff7')

#_hgroot="hg+http://hg.code.sf.net/p/texstudio/hg"
_hgrepo="hg"


pkgver() {
  cd "$srcdir/$_hgrepo"
echo $(hg identify -n).$(hg identify -i)
# hg log -r . --template '{latesttag}.{latesttagdistance}.{node|short}\n'
}

build() {
  cd "$srcdir"
#  msg "Connecting to Mercurial server...."

#  if [ -d $_hgrepo ] ; then
#    cd $_hgrepo
#    hg pull -u
#    msg "The local files are updated."
#  else
#    hg clone $_hgroot $_hgrepo
#  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  if [ -e "$srcdir/$_hgrepo-build" ]; then
    rm -rf "$srcdir/$_hgrepo-build"
  fi
#  mkdir "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"



  pwd
    qmake-qt4 texstudio.pro || return 1
    make || return 1

}

package() {
  cd "$srcdir/$_hgrepo-build"
    make INSTALL_ROOT="$pkgdir" install || return 1
   sed -i $pkgdir/usr/share/applications/texstudio.desktop -e "s:texmakerx:texstudio:"
}




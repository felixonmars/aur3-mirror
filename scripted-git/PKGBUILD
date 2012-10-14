# Maintainer: Romain Schmitz <slopjong@archlinux.lu>

pkgname=scripted-git
pkgver=20121014
pkgrel=1
pkgdesc="Fast and lightweight code editor with an initial focus on JavaScript editing."
arch=('any')
url="http://github.com/scripted-editor/scripted"
license=('EPL')
depends=( 'nodejs' )
#makedepends=( 'git' 'nodejs-marked' )
makedepends=( 'git' )

# there are no binaries and thus no symbols to be stripped
options=( '!strip' ) 

install=scripted.install

_gitroot="https://github.com/scripted-editor/scripted.git"
_gitname="scripted"

build() {

  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"

  #marked -o README.html README.md
}

package() {
	
   # create the necessary directories
   mkdir -p $pkgdir/usr/share/{licenses,doc}/$_gitname
   mkdir -p $pkgdir/opt/$_gitname
   
   cp -R $srcdir/$_gitname $pkgdir/opt
   rm -rf $pkgdir/opt/$_gitname/.git
   rm $pkgdir/opt/$_gitname/bin/*.bat
   
   # licenses
   ln -s $pkgdir/opt/$_gitname/license.txt $pkgdir/usr/share/licenses/$_gitname/LICENSE
   ln -s $pkgdir/opt/$_gitname/open_source_licenses.txt $pkgdir/usr/share/licenses/$_gitname/3rd-PARTY-LICENSES
  
   # documentation
   ln -s $pkgdir/opt/$_gitname/README.md $pkgdir/usr/share/doc/$_gitname/README.md
   #ln -s $pkgdir/opt/$_gitname/README.html $pkgdir/usr/share/doc/$_gitname/README.html
}

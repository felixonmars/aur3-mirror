 
# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=ringo-git
pkgver=20120718
pkgrel=2
pkgdesc="A runtime environment that runs Mac Applications on Linux"
arch=('i686' 'x86_64')
url="http://gitorious.org/ringo"
license=('BSD')
depends=('opencflite-svn' 'gnustep-gui' 'gnustep-make' 'gnustep-base')
makedepends=('clang' 'git')
options=(!strip)

_gitroot=('git://gitorious.org/ringo/ringo.git')
_gitname=('ringo')

build() {
 cd $srcdir

msg "getting ringo sources"
   if [ -d $_gitname ] ; then
    cd $_gitname && git pull $_gitroot
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi
  

msg "setting up build directory"
  rm -rf $srcdir/build #starting fresh
  cp -ar $srcdir/$_gitname $srcdir/build
  cd $srcdir/build
  msg2 "building ringo core libraries"
  ./configure
  make all
  
  msg2 "setting up build variables after bootstrap"
  PATH=${srcdir}/build/Bootstrap:$PATH
  LDFLAGS="$LDFLAGS -L$srcdir/build/build"
  
  cd $srcdir/build
  msg2 "building Foundation"
  sed -i 's|/usr/universal-apple-darwin10/usr/local/bin/universal-apple-darwin10-gcc|clang|' ringo.xgeassproj/Foundation.xgeasstarget
  xgeassbuild ringo.xgeassproj/Foundation.xgeasstarget
#currently fails...
  
  msg2 "building AppKit"
    sed -i 's|/usr/universal-apple-darwin10/usr/local/bin/universal-apple-darwin10-gcc|clang|' ringo.xgeassproj/AppKit.xgeasstarget
  xgeassbuild ringo.xgeassproj/AppKit.xgeasstarget
#currently fails...
  
  #future: building iTerm (hence gnustep dependencies)
}

package() {
 msg "copying licenses"
 mkdir -p $pkgdir/usr/share/licenses/ringo
 cp $srcdir/build/FreeSoftwareLicences/* $pkgdir/usr/share/licenses/ringo/
 
 msg "packaging xgeassbuild - needed?"
 cd $srcdir/build/Bootstrap
 mkdir -p $pkgdir/usr/bin
 install -m0755 xgeassbuild $pkgdir/usr/bin/

 msg "packaging ringo core libraries"
 cd $srcdir/build/build
 mkdir -p $pkgdir/usr/lib
 install -m0755 libmach.so $pkgdir/usr/lib/
 cp -ar System $pkgdir/usr/lib/
 
 msg "packaging Foundaton and AppKit"
 cd $srcdir/build/build
 cp -ar Frameworks $pkgdir/usr/lib/
 #incomplete -need to be able to make them build...
 
 #future: packaging iTerm and other applications
}

pkgname=sikuli-git
_pkgname=sikuli
pkgver=20120708
pkgrel=1
pkgdesc='A visual technology to search and automate graphical user interfaces using screenshots'
arch=('i686' 'x86_64')
license=('MIT')
url="http://www.sikuli.org"
depends=('java-environment' 'opencv-old' 'wmctrl' 'libtiff4' 'tesseract2-opt')
makedepends=('openjdk6' 'cmake' 'gcc44' 'swig' 'tesseract2-opt' 'git')

source=('http://www.sikuli.org/images/ide-icon-64.png' 
	'sikuli-ide.desktop'
	'common.cmake.patch'
	'FindTesseract.cmake.patch'
	'tessocr.cpp.patch')


_gitroot=git://github.com/sikuli/sikuli
_gitname=sikuli

build() {

##GCC44
#clear bin-lib data
  if [ -d $srcdir/bin-lib ]; then
    rm -rf $srcdir/bin-lib
  fi
  mkdir $srcdir/bin-lib -p


#add gcc44 link
  ln -s /usr/bin/gcc-4.4 $srcdir/bin-lib/gcc
  ln -s /usr/bin/g++-4.4 $srcdir/bin-lib/g++
  ln -s /usr/bin/c++-4.4 $srcdir/bin-lib/c++
  ln -s /usr/bin/cpp-4.4 $srcdir/bin-lib/cpp

#add path on bin-lib
  PATH="$srcdir/bin-lib/:$PATH"


##GIT
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/${_gitname}-build"
  cp -r "$srcdir/${_gitname}" "$srcdir/${_gitname}-build"

##START
  cd "$srcdir/${_gitname}-build"

  patch -Np0 -i $srcdir/common.cmake.patch
  patch -Np0 -i $srcdir/FindTesseract.cmake.patch
  patch -Np0 -i $srcdir/tessocr.cpp.patch

  mkdir $srcdir/${_gitname}-build/sikuli-script/build
  cd $srcdir/${_gitname}-build/sikuli-script/build
  cmake ..
  make

  mkdir $srcdir/${_gitname}-build/sikuli-ide/build
  cd $srcdir/${_gitname}-build/sikuli-ide/build
  cmake -DCMAKE_INSTALL_PREFIX=/opt ..
  #make package
  make
  make DESTDIR="$pkgdir" install

}
package(){
    ##Desktop
    mkdir -p $pkgdir/usr/share/{applications,pixmaps} 
    install -m644 ide-icon-64.png $pkgdir/usr/share/pixmaps 
    install -m644 sikuli-ide.desktop $pkgdir/usr/share/applications 

    ##License###
    install -Dm644 $pkgdir/opt/copyright.txt $pkgdir/usr/share/licenses/Sikuli-IDE/LICENSE 
    rm $pkgdir/opt/readme.txt
    rm $pkgdir/opt/copyright.txt

    ##Binary
    sed 's/DIR=`dirname $0`/DIR=\/opt\/Sikuli-IDE/' -i  $pkgdir/opt/Sikuli-IDE/sikuli-ide.sh
    mkdir -p $pkgdir/usr/bin
    ln -s /opt/Sikuli-IDE/sikuli-ide.sh $pkgdir/usr/bin/sikuli-ide.sh
}


md5sums=('c35442418366e6b10bb17751613cbcc6'
         '49df2c8d87c5a55fa50e8216169f4c7f'
         '1388de970c261e409ead1bf843b7b2c1'
         '287260488d93b5821e201f1549eb3134'
         '45b3d768008ce317942aa517d89b8b5e')

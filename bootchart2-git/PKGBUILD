    # Contributor: JohnTheKipper <roteocktober@hotmail.com>
     
    pkgname=bootchart2-git
    pkgrel=1
    pkgver=20130314
    pkgdesc="Boot Process Performance Visualization"
    arch=('i686' 'x86_64')
    url="http://github.com/mmeeks/bootchart"
    license=('GPL')
    provides=('bootchart2')
    conflicts=('bootchart2' 'bootchart')
    depends=('busybox' 'pygtk')
    makedepends=('git' 'python3')
     
    _gitname="bootchart"
    _gitroot="git://github.com/mmeeks/$_gitname.git"
    _gitbranch="python3"
     
    build() {
      cd "$srcdir"
      msg "Connecting to GIT server...."
     
      if [ -d "$_gitname" ] ; then
        cd "$_gitname" && git pull origin
        msg "The local files are updated."
      else
        git clone -b $_gitbranch "$_gitroot" "$_gitname"
      fi
     
      msg "GIT checkout done or server timeout"
      msg "Starting make..."
     
      rm -rf "$srcdir/$_gitname-build"
      git clone -b $_gitbranch "$srcdir/$_gitname" "$srcdir/$_gitname-build"
      cd "$srcdir/$_gitname-build"
     
      sed -i -e 's|python2.6|python2.7|' \
        -e  's|python\b|python2|g'  Makefile
      sed -i 's|#!/usr/bin/python$|#!/usr/bin/python2|' pybootchartgui.py
     
      make
    }
     
    package() {
      cd "$srcdir/$_gitname-build"
      make DESTDIR="$pkgdir" install
    }

# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=gnuplot-git
pkgver=20121202
pkgrel=1
pkgdesc="A command-line driven interactive function and data plotting utility -- inoffifcial github fork"
arch=('i686' 'x86_64')
url="https://github.com/Reen/gnuplot"
license=('custom')
depends=('gd' 'pango' 'lua' 'wxgtk')
makedepends=('git' 'libpng' 'freetype2' 'libjpeg')
provides=('gnuplot=4.7')
conflicts=('gnuplot')
install=$pkgname.install

_gitroot="git://github.com/Reen/gnuplot.git"
_gitname="gnuplot"
build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  [ -d "$srcdir/$_gitname-build" ] && rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./prepare
  # fix default source location; use the GDFONTPATH variable 
  # to modify at runtime 
  sed -i 's|/usr/X11R6/lib/X11/fonts/truetype|/usr/share/fonts/TTF|' \
    src/variable.c
  sed -i 's|/X11R6/lib/X11/fonts/Type1|/usr/share/fonts/Type1|' \
    src/variable.c
  
  ./configure --prefix=/usr --with-gihdir=/usr/share/gnuplot \
    --with-readline=gnu --with-kpsexpand --enable-thin-spline \
    --with-lua --libexecdir=/usr/lib
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" X11_DRIVER_DIR=$pkgdir/usr/bin install
  install -D ../$_gitname/Copyright \
    $pkgdir/usr/share/licenses/$pkgname/Copyright
}

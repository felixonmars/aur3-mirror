# Maintainer: Leandro Lovisolo <cafesolo@gmail.com>
pkgname=gnome-awesome-applet
pkgver=0.1.0
pkgrel=1
pkgdesc="GNOME applet to interact with the Awesome window manager"
url="http://upsilon.cc/~zack/hacking/software/gnome-awesome-applet/"
license=(GPL)
depends=(python2 awesome gnome-panel)
arch=(any)
source=(http://upsilon.cc/~zack/hacking/software/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=(58df905d26d133875cc6e9c093e86171)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  # Configure package
  export PYTHON=/usr/bin/python2 
  export PYTHON_BIN=$PYTHON
  ./configure --prefix=/usr
  
  # Force Python 2
  echo -e "#\x21/usr/bin/python2" > gnome-awesome-applet.new
  tail -n +2 gnome-awesome-applet >> gnome-awesome-applet.new
  rm gnome-awesome-applet
  mv gnome-awesome-applet.new gnome-awesome-applet
  chmod ugo+x gnome-awesome-applet
  
  # Install
  python2 setup.py install --root=$startdir/pkg 
}


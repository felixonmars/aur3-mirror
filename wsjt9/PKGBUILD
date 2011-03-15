# Maintainer: Mike WB2FKO <mph at sportscliche dot com>
pkgname=wsjt9
pkgver=9.0r2136
pkgrel=1
pkgdesc="Weak Signal Communication by K1JT (debian beta release)"
arch=('any')
url="http://physics.princeton.edu/pulsar/K1JT/wsjt.html"
license=('GPL')
depends=('python2' 'python-imaging' 'python2-numpy' 'libsamplerate' 'portaudio' 'fftw')
makedepends=('deb2targz')
source=(http://physics.princeton.edu/pulsar/K1JT/wsjt_${pkgver}_i386.deb
               startwsjt
               $pkgname.png
               $pkgname.desktop)
md5sums=('6f821862dae4ead448b1edecd7e51fd7'
         'b44e27a7e35cb78b484deae4d8e41c1b'
         'dd21318d4aa3423f1fbefc53061cc40d'
         '0c720b63d03be34ad81c1afc1e2c024a')

build() {
#Make a tarball from the debian source file
   deb2targz ${srcdir}/wsjt_${pkgver}_i386.deb
# Expand the tarball
    tar xvzf ${srcdir}/wsjt_${pkgver}_i386.tar.gz
# The program will not run if the files are separated so place the entire package in /opt
    rm -rf $pkgdir/opt/$pkgname
    mkdir -p $pkgdir/opt/$pkgname
    mv WSJT9 "$pkgdir/opt/$pkgname"

    find "$pkgdir/opt/$pkgname/" -type f  | xargs chmod 644
    find "$pkgdir/opt/$pkgname/" -type d | xargs chmod 755

# Install a menu item with icon
  cd $srcdir
  mkdir -p $pkgdir/usr/share/pixmaps
  mkdir -p $pkgdir/usr/share/applications
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 $pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png

# Install a simple launcher script
    install -Dm755 startwsjt $pkgdir/opt/$pkgname/WSJT9/startwsjt

  echo -e "\n WSJT9 will be installed in the /opt directory of root \n"
}

# vim:set ts=2 sw=2 et:

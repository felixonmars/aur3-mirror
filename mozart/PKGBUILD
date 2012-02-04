# Contributer: Matt Beisser <beissemj(at)gmail(dot)com>
# Contributor: BinkyTheClown <binky_at_archlinux_dot_us>
pkgname=mozart
pkgver=1.4.0.20080704
pkgrel=4
pkgdesc="The Mozart Programming System"
arch=('i686')
url="http://www.mozart-oz.org"
license=('custom:X11style')
depends=('gmp' 'emacs' 'tk' 'gdbm')
options=('!makeflags')
source=(http://www.mozart-oz.org/download/mozart-ftp/store/1.4.0-2008-07-02-tar/mozart-1.4.0.20080704-src.tar.gz
        http://www.mozart-oz.org/download/mozart-ftp/store/1.4.0-2008-07-02-tar/mozart-$pkgver-std.tar.gz
        mozart.profile)
md5sums=('d34156dce23a84925f7eae121feb3afe' 'b9e2e6c2d57044b7a2ce7d13e35ff120'\
         'cc4567bb8fad4a81da1903ee092a4886')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=$pkgdir/opt/mozart --disable-contrib-micq --disable-doc 
  make || return 1
  mkdir -p $pkgdir/usr/share/licenses/mozart
  
  make prefix=$pkgdir/opt/mozart install 

  cd $srcdir/$pkgname-$pkgver-std
  ./configure --prefix=$pkgdir/opt/mozart
  make prefix=$pkgdir/opt/mozart install   

  install -m 755 -D $srcdir/mozart.profile $pkgdir/etc/profile.d/mozart.sh
  cp $pkgdir/opt/mozart/LICENSE* $pkgdir/usr/share/licenses/mozart
}

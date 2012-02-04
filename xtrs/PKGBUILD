# Contributor: Joe Peterson <joe at skyrush dot com>

pkgname=xtrs
pkgver=4.9d
pkgrel=1 
pkgdesc="Radio Shack TRS-80 emulator"
url="http://www.tim-mann.org/xtrs.html"
arch=('i686' 'x86_64')
license=('custom')
depends=(ncurses readline libx11)
makedepends=()
conflicts=()
replaces=()
backup=()
install=$pkgname.install
source=(http://www.tim-mann.org/trs80/$pkgname-$pkgver.tar.gz
        http://www.tim-mann.org/trs80/ld4-631.zip
        COPYING)
md5sums=('8bb7cf88a3bc1da890f1f29398120bf3'
         'f2678aa45b76d935a34a0cd2b108925d'
         'fe1257721c755b39cf36dc33442d02af')

build() {
  cd $srcdir/$pkgname-$pkgver

  # Build xtrs
  make DEBUG="${CFLAGS}" \
       DISKDIR="-DDISKDIR='\"/usr/share/xtrs\"'" \
       DEFAULT_ROM="-DDEFAULT_ROM='\"/usr/share/xtrs/romimage\"' \
                    -DDEFAULT_ROM3='\"/usr/share/xtrs/romimage.m3\"' \
                    -DDEFAULT_ROM4P='\"/usr/share/xtrs/romimage.m4p\"'" \
       || return 1

  # Create necessary directories
  mkdir -p $pkgdir/usr/bin \
           $pkgdir/usr/share/$pkgname/disks \
           $pkgdir/usr/share/man/man1 \
           $pkgdir/usr/share/doc/$pkgname \
           $pkgdir/usr/share/licenses/$pkgname
           
  # Install xtrs using upstream make install
  make PREFIX=$pkgdir/usr install || return 1

  # Install sample disk images
  cp cpmutil.dsk utility.dsk $srcdir/ld4-631.dsk \
     $pkgdir/usr/share/$pkgname/disks
  chmod 0444 $pkgdir/usr/share/$pkgname/disks/*
  ln -s disks/ld4-631.dsk $pkgdir/usr/share/$pkgname/disk4p-0
  ln -s disks/utility.dsk $pkgdir/usr/share/$pkgname/disk4p-1

  # Install extra documentation files
  cp ChangeLog README xtrsrom4p.README cpmutil.html dskspec.html \
     $pkgdir/usr/share/doc/$pkgname

  # Install the license text file
  cp $srcdir/COPYING $pkgdir/usr/share/licenses/$pkgname
}

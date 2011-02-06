# Maintainer: Can Celasun <dcelasun[at]gmail[dot]com>

pkgname=adanaxis-gpl
pkgver=1.2.5
pkgrel=1
pkgdesc="A deep space first-person shooter game in four spatial dimensions (GPL version)"
arch=('i686' 'x86_64')
url="http://libregamewiki.org/Adanaxis"
license=('GPL')
depends=('gcc' 'libxxf86misc' 'libxxf86vm' 'mesa' 'freeglut' 'pcre' 'expat' 'giflib' 'libtiff' 'sdl' 'sdl_mixer' 'alsa-lib' 'esound' 'smpeg' 'libogg' 'libvorbis')

source=(http://ftp.de.debian.org/debian/pool/main/a/adanaxisgpl/adanaxisgpl_1.2.5.dfsg.1.orig.tar.gz
                http://ftp.de.debian.org/debian/pool/main/a/adanaxisgpl/adanaxisgpl_1.2.5.dfsg.1-3.debian.tar.gz
                adanaxisgpl.desktop
                adanaxisgpl.png)
                
md5sums=('c5a5f4ec9eb0b8e610207c20b7eebca6'
                      '0e66bdff83fbf44235a18d50669e9ddb'
                      'd8ef474ae27739bb3a98fa2ff3a12032'
                      'fcc803277aefeea9a4c06e2aa823afb9')

build() {
msg "Extracting sources"
tar zxvf adanaxisgpl_1.2.5.dfsg.1.orig.tar.gz
tar zxvf adanaxisgpl_1.2.5.dfsg.1-3.debian.tar.gz

msg "Applying patches" 
cd  $srcdir/debian/patches
cp * $srcdir/adanaxisgpl-1.2.4.dfsg.1 -R
cd $srcdir/adanaxisgpl-1.2.4.dfsg.1

patch -Np1 -i 10_try_more_cache_paths.diff || return 1
patch -Np1 -i 20_fix_FTBFS_with_gcc-4.3.diff || return 1
patch -Np1 -i 30_dont_crash_at_16bpp.diff || return 1
patch -Np1 -i 31_fix-ftbfs-with-gcc4.4.diff || return 1

# Configure and install

./configure --prefix=/usr --exec-prefix=/usr || return 1
make  || return 1
make DESTDIR=$pkgdir install || return 1

# Install desktop file and icon
mkdir -p $pkgdir/usr/share/pixmaps
mkdir -p $pkgdir/usr/share/applications

cd $srcdir
install -m644 adanaxisgpl.png $pkgdir/usr/share/pixmaps
install -m644 adanaxisgpl.desktop $pkgdir/usr/share/applications
}

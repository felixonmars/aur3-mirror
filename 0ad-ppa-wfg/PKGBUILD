# Maintainer: scrawl <scrawl@baseoftrash.de>

pkgname=0ad-ppa-wfg
pkgver=alpha_3_r8832
pkgrel=1
pkgdesc="0ad build from the wildfire games PPA at launchpad.net"
arch=('i686' 'x86_64')
url="http://www.wildfiregames.com/0ad"
license=('GPL2' 'CCPL')
depends=('libpng12' 'binutils' 'boost' 'crypto++' 'devil' 'enet-old' 'fam' 'libogg' 'libvorbis' 'libxml2' 'mesa' 'nasm' 'openal' 'sdl' 'wxgtk' 'zip' 'zlib')
makedepends=('deb2targz')

_arch=$CARCH
[ $CARCH == i686 ] && _arch="i386"
[ $CARCH == x86_64 ] && _arch="amd64"
source=( https://launchpad.net/~wfg/+archive/0ad/+files/0ad_0.0.0%2Br08832-1~10.10~wfg1_$_arch.deb https://launchpad.net/~wfg/+archive/0ad/+files/0ad-data_0.0.0%2Br08832-1~10.10~wfg1_all.deb http://trac.wildfiregames.com/attachment/ticket/492/0ad.packaging.tar.gz?format=raw 0ad.sh )
md5sums=( 36f8e02ae3daf81114eb207dd789c41a fe27ed6aff7752ca76fc88fd199f683a b6c74d2ee0fa4b54b7e617c25794ca3e 540ddc21976439f6d197106bdf2ae6eb )
[ $CARCH == i686 ] && md5sums=( 38b0897f4f6514c9fc2cd10d77205629 fe27ed6aff7752ca76fc88fd199f683a b6c74d2ee0fa4b54b7e617c25794ca3e 540ddc21976439f6d197106bdf2ae6eb )

conflicts=('0ad' '0ad-svn')

build() {
  # Unpack packaging data (.desktop file, icon...)
  tar xvf 0ad.packaging.tar.gz\?format\=raw

  # Unpack and install debs
  deb2targz 0ad_0.0.0%2Br08832-1~10.10~wfg1_$_arch.deb
  tar -xzf 0ad_0.0.0%2Br08832-1~10.10~wfg1_$_arch.tar.gz
  deb2targz 0ad-data_0.0.0%2Br08832-1~10.10~wfg1_all.deb
  tar -xzf 0ad-data_0.0.0%2Br08832-1~10.10~wfg1_all.tar.gz
  mv usr $pkgdir/
  
  # Install run script
  mkdir -p $pkgdir/usr/lib/games/0ad/system
  cp 0ad.sh $pkgdir/usr/lib/games/0ad/system/pyrogenesis
  mkdir $pkgdir/usr/bin
  cp 0ad.sh $pkgdir/usr/bin/0ad
  chmod +x $pkgdir/usr/lib/games/0ad/system/pyrogenesis

  
  # Fix LD errors caused by Ubuntu shipping different library versions
  cd $pkgdir/usr/games
  ln -s /usr/lib/libjpeg.so ./libjpeg.so.62
  ln -s /usr/lib/libtiff.so ./libtiff.so.4
  ln -s /usr/lib/libboost_filesystem.so ./libboost_filesystem.so.1.42.0
  ln -s /usr/lib/libboost_system.so ./libboost_system.so.1.42.0
  ln -s /usr/lib/libenet.so ./libenet.so.0debian1
  
  # Install .desktop file
  cd $srcdir/0ad.packaging
  install -D -m 0644 "0ad.desktop" "$pkgdir/usr/share/applications/0ad.desktop"
  install -D -m 0644 "0ad.png" "$pkgdir/usr/share/pixmaps/0ad.png"

}

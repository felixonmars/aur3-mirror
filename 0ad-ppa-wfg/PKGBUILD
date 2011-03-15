# Maintainer: scrawl <scrawl@baseoftrash.de>
# Contributor: docci

pkgname=0ad-ppa-wfg
pkgver=alpha_4_9049
pkgrel=2
pkgdesc="0ad build from the wildfire games PPA at launchpad.net"
arch=('i686' 'x86_64')
url="http://www.wildfiregames.com/0ad"
license=('GPL2' 'CCPL')
depends=('libpng12' 'binutils' 'boost' 'crypto++' 'devil' 'enet-old' 'fam' 'libogg' 'libvorbis' 'libxml2' 'mesa' 'nasm' 'openal' 'sdl' 'wxgtk' 'zip' 'zlib')
makedepends=('p7zip' 'deb2targz')

_arch=$CARCH
[ $CARCH == i686 ] && _arch="i386"
[ $CARCH == x86_64 ] && _arch="amd64"
source=( https://launchpad.net/~wfg/+archive/0ad/+files/0ad_0.0.0%2Br09049-1~10.10~wfg1_$_arch.deb https://launchpad.net/~wfg/+archive/0ad/+files/0ad-data_0.0.0%2Br09049-1~10.10~wfg1_all.deb http://trac.wildfiregames.com/attachment/ticket/492/0ad.packaging.tar.gz?format=raw 0ad.sh http://ubuntu.mirror.cambrium.nl/ubuntu//pool/universe/b/boost1.40/libboost-filesystem1.40.0_1.40.0-6ubuntu1_$_arch.deb http://ubuntu.mirror.cambrium.nl/ubuntu//pool/universe/b/boost1.40/libboost-system1.40.0_1.40.0-6ubuntu1_$_arch.deb)
md5sums=(  db41aa9ac0ce3ccfc0cc49771cc14a37 8fa8b4cb4dce94882b6b0efb636f3a79 b6c74d2ee0fa4b54b7e617c25794ca3e 9677c33dddf6e20c16f042ae0621082c d685a2421f7e070df57c6b1624a25455 4c34d6a96877b6d79d4cb6d99d805826 )
[ $CARCH == i686 ] && md5sums=( a85dbe6e54d0f9f9af87f363abd5b8b7 8fa8b4cb4dce94882b6b0efb636f3a79 b6c74d2ee0fa4b54b7e617c25794ca3e 9677c33dddf6e20c16f042ae0621082c c516c0edfd025a0925baf2ae6b44790e eb948da264a58a7d6282cce37f9d67ff )

conflicts=('0ad' '0ad-svn')

build() {
  # Unpack packaging data (.desktop file, icon...)
  tar xvf 0ad.packaging.tar.gz\?format\=raw

  # Unpack and install debs
  7z e 0ad_0.0.0%2Br09049-1~10.10~wfg1_$_arch.deb -so |tar -x
  7z e 0ad-data_0.0.0%2Br09049-1~10.10~wfg1_all.deb -so |tar -x
  mv usr $pkgdir/
 
  # Unpack and install libfix
  deb2targz libboost-filesystem1.40.0_1.40.0-6ubuntu1_$_arch.deb
  tar -xzf libboost-filesystem1.40.0_1.40.0-6ubuntu1_$_arch.tar.gz
  deb2targz libboost-system1.40.0_1.40.0-6ubuntu1_$_arch.deb
  tar -xzf libboost-system1.40.0_1.40.0-6ubuntu1_$_arch.tar.gz
  mv usr/lib/ $pkgdir/usr/lib/games/0ad/libfix/
  
  # Install run script
  mkdir -p $pkgdir/usr/lib/games/0ad/system
  cp 0ad.sh $pkgdir/usr/lib/games/0ad/system/pyrogenesis
  mkdir $pkgdir/usr/bin
  cp 0ad.sh $pkgdir/usr/bin/0ad
  chmod +x $pkgdir/usr/lib/games/0ad/system/pyrogenesis
  
  # Fix LD errors caused by Ubuntu shipping different library versions
  cd $pkgdir/usr/lib/games/0ad/libfix
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

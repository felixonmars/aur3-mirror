pkgname=uqm-hd
pkgver=0.2
pkgrel=2
pkgdesc="Ur-Quan Masters HD edition. . An HD remake of Star Control 2. It's the full Ur-Quan Masters game but also featuring a high resolution mode, new features, & new artwork."
url="http://urquanmastershd.com/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('uqm' 'uqm-sound' 'openal' 'sdl' 'libgl' 'libmikmod' 'libogg' 'libvorbis' 'sdl_image' 'zlib')
optdepends=('uqm-remix')
makedepends=( 'deb2targz' 'sed' )
conflicts=()
replaces=()
backup=()
install=
source=("http://downloads.sourceforge.net/project/urquanmastershd/Beta%201/uqm-hd_0.2.src.tar.gz"
    "uqm-hd-content.deb::http://downloads.sourceforge.net/project/urquanmastershd/Beta%201/debs/uqm-hd-content_0.2-1_all.deb"
    "uqm-hd-hires4x.deb::http://downloads.sourceforge.net/project/urquanmastershd/Beta%201/debs/uqm-hd-hires4x_0.2-1_all.deb"
    "uqm-hd-hires2x.deb::http://downloads.sourceforge.net/project/urquanmastershd/Beta%201/debs/uqm-hd-hires2x_0.2-1_all.deb"
	"config.state"
	"uqm-hd.xpm"
	"uqm-hd.desktop")
md5sums=('f6ae04927ac9726b20a6faa7e7b7bbf6'
         '568454cd3be188e826a2446a0615ac5e'
         'e41e3b39dcdaf3573a23e3ab3022b3fa'
         'b73e4602312de491803722eef725fc86'
         'c4236f0550cfff652da6e5d8e1989dcb'
         '1e8a17fd7114e17919036ab781b0ab39'
         '7a87fd499304e3b0dcf6dff70e4a8fc6')

noextract=("uqm-hd-content.deb" "uqm-hd-hires4x.deb" "uqm-hd-hires2x.deb")
OPTIONS=( !strip )


build() {
  cd $srcdir/uqm-hd-0.2
  cp ../config.state ./ -v
#  sed -i "s|{PREFIX}|${pkgdir}|g" config.state

 # cat config.state
#  exit 0
  
#  ./build.sh uqm clean
 #  ./build.sh uqm config
  ./build.sh uqm reprocess_config
#  cat build.vars
  ./build.sh uqm
  
  
  cd $srcdir
  deb2targz uqm-hd-content.deb
  deb2targz uqm-hd-hires2x.deb
  deb2targz uqm-hd-hires4x.deb
}

package(){
  cd $srcdir/uqm-hd-0.2

  sed -i "s|\(uqm_INSTALL_BINDIR\)=.*|\1='$pkgdir/usr/bin/'|g" build.vars
  sed -i "s|\(uqm_INSTALL_LIBDIR\)=.*|\1='$pkgdir/usr/lib/'|g" build.vars
  sed -i "s|\(uqm_INSTALL_SHAREDIR\)=.*|\1='$pkgdir/usr/share/'|g" build.vars

  
  ./build.sh uqm install

  sed -i "s|\"\(/usr/lib/uqm/uqm-h\)\"|\"\1d\"|g" $pkgdir/usr/bin/uqm-hd
  
  cd $pkgdir
  tar xf $srcdir/uqm-hd-content.tar.gz
  tar xf $srcdir/uqm-hd-hires2x.tar.gz
  tar xf $srcdir/uqm-hd-hires4x.tar.gz
  
  cd usr/share
  
  mv -v games/uqm-hd/content/*  uqm/content/
  rm -v uqm/content/version
  rm games -Rfv
  
  mkdir applications pixmaps
  cp -dpr --no-preserve=ownership "$srcdir/uqm-hd.desktop" applications/ -v
  cp -dpr --no-preserve=ownership "$srcdir/uqm-hd.xpm" pixmaps/ -v
}

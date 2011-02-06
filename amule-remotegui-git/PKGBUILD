# Maintainer: Gavin <gav616 at gmail dot com>

pkgname=amule-remotegui-git
pkgver=20101009
pkgrel=1
pkgdesc='An eMule-like P2P client, focusing on the bleeding edge experimental aMuleGUI and aMuleD'
arch=('i686' 'x86_64')
url="http://www.amule.org"
license=('GPL')
depends=('wxgtk>=2.8.10.1' 'binutils' 'geoip')
makedepends=('git' 'crypto++' 'ccache')
conflicts=('amule' 'amule-adnza' 'amule-adnza-svn' 'amule-devel' 'amule-dlp' \
	   'amule-dlp-gcc4.5' 'amule-remote' 'amule-remote-cvs' 'amule-remote-upnp' \
	   'amule-remote-upnp-svn' 'amule-upnp')
provides=('amule=2.2.6')
source=('amule.conf' 'amuled')
backup=('etc/conf.d/amule.conf')
install='amule.install'
options=('!docs' 'ccache')
md5sums=('ff70a948f71ec7af26652dfcf6432e7d'
         'a0a4e769e859a1c6680d420d57dba111')

_gitroot="git://repo.or.cz/amule.git"
_gitname="amule"

build() {
  echo -e '\E[37;44m'"\033[1m
  If using 'makepkg' please don't use the cleanup option (makepkg -c),
  it will delete the build directory which defeats the object of using GIT.\033[0m"
  sleep 10
  
  cd $startdir/src
  msg "Connecting to 'repo.or.cz' GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
  cd $_gitname && git-pull origin
  msg "The local files are updated."
  else
  git clone --depth 1 $_gitroot $_gitname
  fi
  
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cp -r $startdir/src/$_gitname $startdir/src/$_gitname-build
  cd $startdir/src/$_gitname-build
 
    ./configure --prefix=/usr \
	--disable-monolithic \
	--enable-amule-daemon \
	--enable-amulecmd \
	--disable-webserver \
	--enable-amule-gui \
	--disable-cas \
	--disable-wxcas \
	--disable-ed2k \
	--disable-alc \
	--disable-alcc \
	--disable-xas \
	--disable-plasmamule \
	--disable-kde-in-home \
	--enable-geoip \
	--disable-upnp \
	--enable-mmap \
	--disable-nls \
	--disable-debug \
	--enable-ccache || return 1

    make || return 1
    
    make DESTDIR=$pkgdir install || return 1
    
 install -D -m755 $startdir/amuled $pkgdir/etc/rc.d/amuled
 install -D -m644 $startdir/amule.conf $pkgdir/etc/conf.d/amule.conf
}

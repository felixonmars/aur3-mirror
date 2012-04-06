
_pluginname=rotorng
pkgname=vdr-plugin-$_pluginname-git
pkgver=20120406
revision=1
pkgrel=1
arch=(i686 x86_64)
pkgdesc="For archvdr project!!! VDR-Plugin to control rotor. You can also use it as a channelscanner."
url="http://projects.vdr-developer.org/projects/plg-rotor-ng"
license="GPL"
makedepends=('git')
depends=('vdr>=1.7.27' 'zip')
backup=('etc/vdr/plugins/plugin.rotorng.conf')
source=(plugin.rotorng.conf)
md5sums=('89ba2f74cb03d8855599bf3a846bcceb')
backup=('etc/vdr/plugin.rotorng.conf')
_gitroot=https://github.com/oldmanuk/rotorng.git
_gitname=rotorng-git

build() {
#  unset CXXFLAGS
  cd $srcdir
  msg "Connecting to GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf $srcdir/$_gitname-build
  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build

  mkdir -p $pkgdir/usr/lib/vdr/plugins/ || return 1
  mkdir -p $pkgdir/var/lib/vdr/plugins/transponders/ || return 1
  mkdir -p $pkgdir/etc/vdr/plugins/transponders/ || return 1
#  sed -i -e "s/SystemValues/SystemValuesSat/" rotorng.c
  sed -i -e "s/const\ cDevice\ \*Device\,\ int\ ChannelNumber/const\ cDevice\ \*Device\,\ int\ ChannelNumber\,bool\ LiveView/" rotorng.c
  make VDRDIR=/usr/include/vdr \
       LIBDIR=. \
       INCLUDES=-I/usr/include/vdr \
       LOCALEDIR="$startdir/pkg/usr/share/locale/" all || return 1
  
  mkdir -p $pkgdir/usr/lib/vdr/plugins						|| return 1
  install -m 755 libvdr-*.so.*		$pkgdir/usr/lib/vdr/plugins/		|| return 1
  install -m 644 $srcdir/plugin.rotorng.conf		$pkgdir/etc/vdr/plugins/		|| return 1


  wget http://www.fastsatfinder.com/bin/Transponders.zip -O $pkgdir/var/lib/vdr/plugins/transponders/Transponders.zip
  cd $pkgdir/var/lib/vdr/plugins/transponders/
  unzip Transponders.zip
}


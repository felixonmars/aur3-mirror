# Maintainer: iv597 <iv5970@gmail.com>
#
# Contributor: thoughtcrime


pkgname=gtkradiant-git
pkgver=20120702
pkgrel=1
pkgdesc="Development version of the level editor, also known as ZeroRadiant"
arch=('x86_64' 'i686')
url="http://www.qeradiant.com/cgi-bin/trac.cgi/wiki/ZeroRadiant"
license=('GPL' 'BSD' 'LGPL')
groups=()
depends=('gtk2' 'gtkglext>=1.0.0' 'libxml2>=2.0.0' 'zlib>=1.2.0' 'libpng>=1.2.0' 'mhash>=0.9.0')
makedepends=('git' 'scons>=0.96' 'python>=2.3.0')
optdepends=('gtkradiant-gamepack-urt-svn: Urban Terror game pack')
provides=('gtkradiant' 'gtkradiant-svn')
conflicts=('gtkradiant' 'gtkradiant-svn')
source=('gtkradiant.sh' 'gtkradiant.desktop' 'gtkradiant.png')
md5sums=('a7e9a67539be8404f4a5203aa2601bf1'
         '3314f51c060e142bffa0a9c40a4d8e48'
         'ee89404891c2fbca799f083efb05e6fd')


_gitroot="https://github.com/TTimo/GtkRadiant.git"
_gitname="gtkradiant"

build() {
  cd "$srcdir"
    if [ -d $_gitname ] ; then 
        cd $_gitname && git pull origin 
        msg "The local files are updated." 
    else 
        git clone $_gitroot $_gitname 
    fi

  msg "GIT checkout done or server timeout"
  msg "Starting scons..."

  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  # Quick & dirty glib fix. Could probably be better done as a diff patch 
  # or with sed, but I'm lazy and this works.
  grep -Ev '<glib/gconvert|<glib/gmem' \
	  tools/quake3/common/inout.c > tools/quake3/common/inout.c.new
  mv tools/quake3/common/inout.c.new tools/quake3/common/inout.c

  # BUILD
  
  scons
  
  # Install everything
  install -d "$pkgdir/usr/share/"
  cp "$srcdir/$_gitname-build/install/" "$pkgdir/usr/share/gtkradiant/" -r
  
  # Remove the games directory, the launch script
  # links it to the home directory. Read it for more
  # information.
  # -- POSSIBLY UNNEEDED? We'll see what breaks...
  #  rm "$pkgdir/usr/share/gtkradiant/games" -r
  
  # Copy the launch script
  install -Dm755 "$srcdir/gtkradiant.sh" "$pkgdir/usr/bin/gtkradiant"
  
  # Copy the menu shortcut and icon
  install -Dm644 $srcdir/gtkradiant.desktop $pkgdir/usr/share/applications/gtkradiant.desktop
  install -Dm644 $srcdir/gtkradiant.png $pkgdir/usr/share/pixmaps/gtkradiant.png
  
}

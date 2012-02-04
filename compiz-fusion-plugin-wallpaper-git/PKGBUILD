#Contributor: Zephyr
 pkgname=compiz-fusion-plugin-wallpaper-git
 pkgver=20080331
 pkgrel=2
 pkgdesc="Compiz Fusion Wallpaper plugin"
 arch=('i686' 'x86_64')
 url="http://compiz-fusion.org"
 license=('GPL')
 depends=('compiz-git' 'compiz-bcop-git' 'compiz-fusion-plugins-main-git')
 makedepends=('git' 'intltool' 'pkgconfig' 'gettext')
 groups=('compiz-fusion-git')
 conflicts=('compiz-fusion-wallpaper-plugin')
 source=()
 md5sums=()
 
 
 _gitroot="git://anongit.opencompositing.org/fusion/plugins/wallpaper"
 _gitname="wallpaper"
 
 build() {
 msg "Connecting to opencompositing.org GIT server...."
 
 if [[ -d $startdir/src/$_gitname ]] ; then
 cd $_gitname
 git-pull origin || return 1
 msg "The local files are updated."
 else
 git clone $_gitroot || return 1
 fi
 
 msg "GIT checkout done"
 msg "Starting make..."
 
 #Create pkg directories
 cd $startdir
 mkdir -p pkg/usr/{lib,include,share}/compiz
 
 # Remove old -build
 rm -rf $startdir/src/$_gitname-build
 
 cp -r $startdir/src/$_gitname $startdir/src/$_gitname-build
 cd $startdir/src/$_gitname-build
 
 make || return 1
 
 install -m 644 $startdir/src/wallpaper-build/build/libwallpaper.la $startdir/pkg/usr/lib/compiz/
 install -m 644 $startdir/src/wallpaper-build/build/wallpaper.xml $startdir/pkg/usr/share/compiz
 install -m 644 $startdir/src/wallpaper-build/build/wallpaper_options.h $startdir/pkg/usr/include/compiz/
 
 make DESTDIR=$startdir/pkg/usr/lib/compiz install
 
 cd $startdir/src
 rm -rf $_gitname-build

 rm ~/.compiz/metadata/wallpaper.xml
 rmdir -p ~/.compiz/metadata
 }

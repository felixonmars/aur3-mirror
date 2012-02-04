# Select GUI qt or gtk.
GUI="gtk"

pkgname=wepcrackgui-git
pkgver=20111111
pkgrel=1
pkgdesc="Gui for aircrack-ng that can crack WEP and WPA networks, automatically scans for available networks, provides fake authentication and injection support."
arch=('i686' 'x86_64')
license=('GPL')
if [[ "$GUI" = "gtk" ]]; then
	depends=('mono' 'gtk-sharp-2' 'aircrack-ng' 'gksu')
else
	depends=('mono' 'kdebindings-qyoto' 'aircrack-ng' 'gksu')
fi
makedepends=('git')
optdepends=('crunch: For Cracking WPA/WPA2 without wordlists.' 'mdk3: For Essid discovery.' 'pyrit: For Cracking WPA/WPA2 whith pyrit.')
url="http://sourceforge.net/projects/wepcrackgui/"
source=('wepcrack.desktop' 'wepcrack.sh' 'qwepcrack.sh')
md5sums=('b6dcf177db7008072718d88296c139fa' 'a06b818c5d55942510aaccfe97e6b0ea' 'b094bd076a03779b1765fadf969110c7')
_gitroot="git://wepcrackgui.git.sourceforge.net/gitroot/wepcrackgui/wepcrackgui"
_gitname="wepcrackgui"

build() {
  cd $srcdir
  msg "Connecting to the GIT server...."
  
  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi
  
  msg "GIT checkout done"
  msg "Starting make..."

  git clone $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build
  if [[ "$GUI" = "gtk" ]]; then
	./configure --prefix=/usr --config=DEBUGGTK
  else
	./configure --prefix=/usr --config=DEBUGQT
  fi
#  cp -p WepCrackInterfaces/bin/Release WepCrackInterfaces/bin/Debug
  make
  make DESTDIR=$pkgdir install
  cd $startdir
  if [[ "$GUI" = "gtk" ]]; then
  	install -Dm755  "$srcdir/wepcrack.sh" "$pkgdir/usr/bin/wepcrack"
  else
	install -Dm755  "$srcdir/qwepcrack.sh" "$pkgdir/usr/bin/wepcrack"	
  fi
  install -Dm755  "$srcdir/wepcrack.desktop" "$pkgdir/usr/share/applications/wepcrack.desktop"
  rm -rf $srcdir/$_gitname-build
}

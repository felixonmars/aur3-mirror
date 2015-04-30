pkgname=gamecaster
pkgver=0.3    
pkgrel=10
arch='any'
pkgdesc="A graphical user interface for open source framework 'glc'"
depends=('ffmpeg' 'xdotool' 'glc' 'vorbis-tools' 'mkvtoolnix-cli' 'python'
         'gnome-menus2' 'libappindicator-gtk3' 'python2-distutils-extra' 
         'python2-gobject'
         'python2-xdg'
	 'hicolor-icon-theme' )
if test "$CARCH" == x86_64; then
	optdepends=('lib32-glc: for 32 bit support')
fi
url="https://launchpad.net/gamecaster"
install=gamecaster.install
source=("https://launchpad.net/gamecaster/trunk/0.3/+download/gamecaster-0.3.tar.gz"
	"https://bugs.launchpad.net/gamecaster/+bug/1345933/+attachment/4158531/+files/fix-fileChooser.patch")
md5sums=('cd70d7ec4aa26c94d17da494fa992bb8'
         '1263d217e4c00d674c6076b36d184b0a')
license='GPL'

package() {
  cd "$srcdir/$pkgname"

  patch -p1 < $srcdir/fix-fileChooser.patch

  python2 setup.py install --root=$pkgdir
}


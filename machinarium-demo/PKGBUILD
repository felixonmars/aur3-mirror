# Contributor: Todd Partridge (Gen2ly) <toddrpartridge (at) gmail>

pkgname=machinarium-demo
_pkgname="Machinarium Demo"
pkgver=EN7
pkgrel=1
pkgdesc="A point-and-click adventure game by the creators of Samarost"
arch=('i686' 'x86_64')
url="http://machinarium.net/"
license=('custom')
if [ "${CARCH}" = "x86_64" ]; then
  depends=('flashplugin' 'lib32-gtk2' 'lib32-libxt' 'lib32-nss')
else
  depends=('flashplugin' 'gtk2' 'libxft' 'nss')
fi
source=(http://machinarium.net/download/Machinarium-Demo-EN7.tar.gz
        machinarium-demo.png
        machinarium-demo.desktop)
md5sums=('785c85e1c875f729444c98bea0fbbc48'
         'fb9978e2f24ff2db118a8031b1a218e7'
         'ec550d19b20f7bf6c4975b2b4061965a')


build () {

  # Create pkgdir folders
  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/share/{applications,games/machinarium-demo,icons}
  install -d $pkgdir/usr/share/licenses/$pkgname

  # Install files
  cd "$srcdir/$_pkgname"
  mv "$_pkgname" $pkgname

  # license

  # game folder
  cp -r * $pkgdir/usr/share/games/$pkgname/

  # executable link
  ln -s /usr/share/games/$pkgname/$pkgname $pkgdir/usr/bin/

  # icon/.desktop
  cd $startdir
  install -Dm644 $pkgname.png $pkgdir/usr/share/icons/
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/

}

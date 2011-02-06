# Contributor: Hokum <hokum_at_mail_dot_ru>

pkgname=vangers-community-rus
_pkgname=Vangers_Community_Linux_rus_svn283
pkgver=svn238
pkgrel=3
pkgdesc="Vangers Open Beta Game, svn283 binary build, russian."
arch=('i686' 'x86_64')
url="http://bitcheese.net/wiki/howto/vangers-linux"
license=('other')
install='vangers.install'
depends=('mesa' 'sdl_mixer' 'sdl_net' 'ffmpeg' 'clunk-svn' 'libvorbis' 'libogg')
source=(http://slingonsk.ru/vangers/Vangers_Community_Linux_rus_svn283.tar.bz2
        $pkgname.desktop
        vangers.png
        vangers32
        vangers64)
sha256sums=('150682f39194a7be2154fb7511aeae42ba8fe65c0f2cc70e87dae4ddae68e9f5'
         'c2fa001737db3a934f3e0174b386b75fe708f6d7d5cf17d559ca2c0691dac372'
         'ea37f45ece6b174885ae8732da53bfd5a7c278d9fe169dc04613c36e721dcbdd'
         'e39d44e0f63817b1d36de7317415ab1d9e000012c37eb1e1ead9fa10d1294b85'
         '2f389b4a0dc9510a61374eda658d8178b0e383918f892457dcb4725c27636480')


build() {

	cd $srcdir

  # create pkgdir folders
  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/share/{applications,games,icons}

  # game folder
  cp -R $_pkgname $pkgdir/usr/share/games/$pkgname

  # executable link
  install -m775 $startdir/vangers32 $pkgdir/usr/share/games/$pkgname/
  install -m775 $startdir/vangers64 $pkgdir/usr/share/games/$pkgname/
  
  if [ "$CARCH" = "i686" ]; 
  then ln -s /usr/share/games/$pkgname/vangers32 $pkgdir/usr/bin/vangers 
  else ln -s /usr/share/games/$pkgname/vangers64 $pkgdir/usr/bin/vangers
  fi

  # icon/.desktop
  install -m644 $startdir/vangers.png $pkgdir/usr/share/icons/vangers.png
  install -m644 $startdir/$pkgname.desktop $pkgdir/usr/share/applications/

}

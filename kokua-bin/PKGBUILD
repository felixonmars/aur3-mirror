# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: mikers <mikeonthecomputer@gmail.com>
# Contributor: Splex


pkgname=kokua-bin
pkgver=3.7.12.34831
_pkgver=3_7_12_34831
_pkgprever=3.7.12
pkgrel=1
pkgdesc="An Open Source third party viewer for Second Life® (secondlife) and OpenSim (opensimulator) grids."
url="http://www.kokuaviewer.org"
license=('GPL')
#install=kokua.install
arch=('i686' 'x86_64')
depends=('apr-util' 'gtk2' 'libgl' 'libidn' 'libjpeg-turbo' 'mesa' 'nss' 'sdl' 'glu' 'pangox-compat')
optdepends=('libpulse: for PulseAudio support' 'alsa-lib: for ALSA support' 'nvidia-utils: for NVIDIA support' 'flashplugin: for inworld Flash support' 'gstreamer0.10: for video support, may need good, bad and ugly plugins' 'lib32-freealut: for OpenAL support')


if [ "$CARCH" = "i686" ]; then
source=("http://sourceforge.net/projects/kokua.team-purple.p/files/Kokua-${_pkgprever}/Kokua_${_pkgver}_${CARCH}.tar.bz2"
		'kokua.desktop'
		'kokua.launcher'
		'donotregister.patch')
md5sums=('2f0157d99fe439e9f9ce79bceab545ba'
         'ea1ea1c347c70c6abeaf5b1a2ac079fc'
         '87a28e5c1e3762c12077b2a9a46b0dfa'
         '1b4db712c2db43c0ae4f69b6b5410c43')
        
elif [ "$CARCH" = "x86_64" ]; then
source=("http://sourceforge.net/projects/kokua.team-purple.p/files/Kokua-${_pkgprever}/Kokua_64_${_pkgver}_${CARCH}.tar.bz2"
		'kokua.desktop'
		'kokua.launcher'
		'donotregister.patch')
md5sums=('4346b79d9c48de89955ecc244cbf99eb'
		 'ea1ea1c347c70c6abeaf5b1a2ac079fc'
         '87a28e5c1e3762c12077b2a9a46b0dfa'
         '1b4db712c2db43c0ae4f69b6b5410c43')
fi


package() {
cd $srcdir
  
# Rename Data Directory
if [ "$CARCH" = "i686" ]; then
mv Kokua_${_pkgver}_$CARCH kokua-bin
elif [ "$CARCH" = "x86_64" ]; then
mv Kokua_64_${_pkgver}_$CARCH kokua-bin
fi

# Do not register the application (saves from badly-installed desktop files and icons)
  patch kokua-bin/kokua donotregister.patch
  rm kokua-bin/etc/refresh_desktop_app_entry.sh


  # Install Desktop File
  install -D -m644 $srcdir/kokua.desktop \
    $pkgdir/usr/share/applications/kokua.desktop
  
  # Install Icon File
  install -D -m644 $srcdir/kokua-bin/kokua_icon.png \
    $pkgdir/usr/share/pixmaps/kokua-bin.png
  
  # Install Launcher
  install -D -m755 $srcdir/kokua.launcher \
    $pkgdir/usr/bin/kokua-bin

  # Move Data to Destination Directory
  install -d $pkgdir/opt
  mv kokua-bin $pkgdir/opt/

  # Change Permissions of files to root:games
  chown -R root:games $pkgdir/opt/kokua-bin
  chmod -R g+rw $pkgdir/opt/kokua-bin
  # Make Binary Group-Executable
  chmod g+x $pkgdir/opt/kokua-bin/kokua


}

#Contributor: robb_force <robb_force>

pkgname=daphne-beta
_pkgname=daphne
pkgver=1.0
pkgrel=1
pkgdesc="A command-line multiple arcade laserdisc emulator."
url="http://www.daphne-emu.com/"
license="GPL"
arch=('i686')
depends=('sdl_mixer' 'zlib' 'gcc-libs')
conflicts=('daphne')
provides=('daphne=1.0')
source=(http://www.daphne-emu.com/download/${_pkgname}-${pkgver}beta-linux.tar.gz \
  daphne.sh )
md5sums=('a7812a93bc19fe9ec4cd0a1a7066c71f'
         '58c7d5cb0fa68a386692ee35cc675d4b')

build()
{
  # Install the scripts
  cd ${startdir}/src 
  install -Dm755 daphne.sh ${startdir}/pkg/usr/bin/${_pkgname}
  
  # Install everything else in /opt/daphne-beta
  # daphneloader can be run from here to do updates or run games.
  cd ${startdir}/src/${_pkgname}
  mkdir -p ${startdir}/pkg/opt/${pkgname}
  cp -R * ${startdir}/pkg/opt/${pkgname}/
  
  # Change group to games
  chown -R :games ${startdir}/pkg/opt/${pkgname}

  # Set permissions for files and folders
  find ${startdir}/pkg/opt/${pkgname} -type f -exec chmod 660 {} +
  find ${startdir}/pkg/opt/${pkgname} -type d -exec chmod 770 {} +  

  # Set permissions for the executables
  cd ${startdir}/pkg/opt/${pkgname}
  chmod 770 {daphne,daphneloader,daphneloader.bin,input_grabber}
}

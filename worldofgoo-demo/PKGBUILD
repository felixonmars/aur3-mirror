# Contributor: AlexanderR <alexander r at gmx com>
# Contributor: gadget3000 <gadget3000 at msn dot com>
# Contributor: Todd Partridge <toddrpartridge at gmail dot com>

pkgname=worldofgoo-demo
_pkgname=WorldOfGooDemo
pkgver=1.41
pkgrel=2
pkgdesc="World of Goo is a physics based puzzle/construction game."
arch=('i686' 'x86_64')
url="http://2dboy.com/games.php"
license=('custom')
depends=('mesa' 'sdl_mixer' 'libogg' 'sdl' 'libvorbis')
source=($pkgname.desktop
        'config.txt')
md5sums=('2c51596fa6c1afa7bcb39da559015881'
         '408f3d4eec70452f2a7927ed51e113ad')
options=(!strip)

_archive_md5="2a490524ae2cfd11fcb2e052dfe47d4e"
_archive="WorldOfGooDemo.${pkgver}.tar.gz"

build() {

  cd $srcdir
 
  if [ ! -f ${_archive} ]; then
    wget -r -np -nd -H "http://worldofgoo.com/dl2.php?lk=demo&filename=${_archive}"
  fi

  if ! echo "${_archive_md5}  ${_archive}" | md5sum -c --quiet; then
    echo "Invalid checksum for ${_archive}"
    return 1
  fi

  # create pkgdir folders
  install -d $pkgdir/usr/bin
  install -d $pkgdir/opt/${_pkgname}
  install -d $pkgdir/usr/share/{applications,icons}
  install -d $pkgdir/usr/share/licenses/$pkgname

  tar xzf ${_archive} -C ${pkgdir}/opt/

  rm -fr ${pkgdir}/opt/${_pkgname}/libs{32,64}

  if [ "$CARCH" = "x86_64" ]; then
     rm -fr ${pkgdir}/opt/${_pkgname}/WorldOfGoo.bin32
  else
     rm -fr ${pkgdir}/opt/${_pkgname}/WorldOfGoo.bin64
  fi

  # licenses
  install -m644 ${pkgdir}/opt/$_pkgname/eula.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

  # executable link
  echo \#\!/bin/sh > $pkgdir/usr/bin/$pkgname
  echo cd /opt/$_pkgname/ >> $pkgdir/usr/bin/$pkgname
  echo ./WorldOfGoo >> $pkgdir/usr/bin/$pkgname
  chmod +x $pkgdir/usr/bin/$pkgname

  # icon/.desktop
  install -m644 ${pkgdir}/opt/$_pkgname/icons/scalable.svg \
  $pkgdir/usr/share/icons/$pkgname.svg
  install -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/

  #fix sound on x86_64
  cp -f ${srcdir}/config.txt $pkgdir/opt/${_pkgname}/properties/
}

# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: Vaino Helminen <vah78@yahoo.com>

pkgname=alephone-highres
pkgver=2
pkgrel=1
pkgdesc="HiRes content for the Marathon line of games"
arch=('any')
url="http://source.bungie.org/get/"
license=('unknown')
depends=('alephone>=20060701')
optdepends=('alephone-marathon: Marathon 1 (M1A1) scenario'
            'alephone-marathon2: Marathon 2: Durandal scenario'
            'alephone-infinity: Marathon Infinity scenario'
            'alephone-ttep-marathon: Marathon 1 HiRes textures'
            'alephone-ttep-marathon2: Marathon 2 Hires textures'
            'alephone-ttep-infinity: Marathon Infinity HiRes textures')
source=(http://www.simplici7y.com/version/file/189/wep141.zip
        http://nardofiles.bungie.org/shots_fired.zip
        http://www.simplici7y.com/version/file/299/m1redux_v1.0.zip
        http://www.simplici7y.com/version/file/300/m23redux_v1.0.zip
        http://www.simplici7y.com/version/file/126/High-res_Landscapes1.1.zip)
md5sums=('3cc3653d02ee41e971a269cfd52cb119'
         '0ad452758083e8fb87f89ad8970ece0a'
         'facaa0cb41edbbee13477986fcabf59b'
         '1d0ed0f1ed2c95f4f83672c180cc1bcb'
         '5b3978f3ab0df10db21b11b7786647d7')

build() {
  mkdir -p "$pkgdir/usr/share/alephone/highres/Scripts"
  for i in marathon marathon2 infinity ; do
     mkdir -p "$pkgdir/usr/share/alephone/scenarios/$i/Scripts"
  done

  msg2 'Weapon Enhancement Pack...'
  cd "$srcdir/wep141"
  install -m 644 *.mml "$pkgdir/usr/share/alephone/highres/Scripts/"
  find . -type f -name \*.dds | while read i; do
     install -D -m 644 "$i" "$pkgdir/usr/share/alephone/highres/$i"
  done
  for i in marathon2 infinity ; do
      ln -s ../../../highres/Scripts/{explosions,wep}.mml "$pkgdir/usr/share/alephone/scenarios/$i/Scripts/"
      ln -s ../../highres/wep "$pkgdir/usr/share/alephone/scenarios/$i/"
  done

  msg2 'Shots Fired...'
  cd "$srcdir"
  install -m 644 Scripts/*.mml "$pkgdir/usr/share/alephone/highres/Scripts/"
  find tex -type f -name \*.dds | while read i; do
     install -D -m 644 "$i" "$pkgdir/usr/share/alephone/highres/$i"
  done
  for i in marathon2 infinity ; do
      ln -s ../../../highres/Scripts/{Shots,Transparent_Sprites}.mml "$pkgdir/usr/share/alephone/scenarios/$i/Scripts/"
      ln -s ../../highres/tex "$pkgdir/usr/share/alephone/scenarios/$i/"
  done

  msg2 'm1redux pack...'
  cd "$srcdir/m1redux_v1.0"
  install -m 644 *.mml "$pkgdir/usr/share/alephone/scenarios/marathon/Scripts/"
  find . -type f -name \*.dds | while read i; do
     install -D -m 644 "$i" "$pkgdir/usr/share/alephone/scenarios/marathon/$i"
  done

  msg2 'm23redux pack...'
  cd "$srcdir/m23redux_v1.0"
  install -m 644 *.mml "$pkgdir/usr/share/alephone/highres/Scripts/"
  find . -type f -name \*.dds | while read i; do
    install -D -m 644 "$i" "$pkgdir/usr/share/alephone/highres/$i"
  done
  for i in marathon2 infinity ; do
      ln -s ../../../highres/Scripts/m23redux.mml "$pkgdir/usr/share/alephone/scenarios/$i/Scripts/"
      ln -s ../../highres/m23redux "$pkgdir/usr/share/alephone/scenarios/$i/"
  done

  msg2 'High-res Landscapes...'
  cd "$srcdir/High-res Landscapes 1.1/Marathon 2 Durandal"
  install -m 644 *.mml "$pkgdir/usr/share/alephone/scenarios/marathon2/Scripts/"
  find . -type f -name \*.dds | while read i; do
     install -D -m 644 "$i" "$pkgdir/usr/share/alephone/scenarios/marathon2/$i"
  done
  
  cd "$srcdir/High-res Landscapes 1.1/Marathon Infinity"
  install -m 644 *.mml "$pkgdir/usr/share/alephone/scenarios/infinity/Scripts/"
  find . -type f -name \*.dds | while read i; do
     install -D -m 644 "$i" "$pkgdir/usr/share/alephone/scenarios/infinity/$i"
  done

  cd "$srcdir/High-res Landscapes 1.1/Optional Fog Script"
  install -m 644 *.mml "$pkgdir/usr/share/alephone/scenarios/marathon2/Scripts/"
  install -m 644 *.mml "$pkgdir/usr/share/alephone/scenarios/infinity/Scripts/"  
}

# vim:set ts=2 sw=2 et:

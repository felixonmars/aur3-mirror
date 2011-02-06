# Contributor: rabyte <rabyte__gmail>

pkgname=gnaural-schedule
pkgver=2
pkgrel=1
pkgdesc="Additional schedule files for Gnaural2"
arch=('i686' 'x86_64')
url="http://pantheon.yale.edu/%7Ebbl2/GnauralExampleFiles.html"
license=('unknown')
depends=('gnaural2')
install=$pkgname.install
source=(http://pantheon.yale.edu/%7Ebbl2/NewMeditation.gnaural \
	http://pantheon.yale.edu/%7Ebbl2/AirplaneTravelAid.gnaural \
	http://pantheon.yale.edu/%7Ebbl2/wakeup.gnaural \
	http://pantheon.yale.edu/%7Ebbl2/alert.gnaural \
	http://pantheon.yale.edu/%7Ebbl2/generated-waves.gnaural \
	http://pantheon.yale.edu/%7Ebbl2/waves.gnaural \
	http://pantheon.yale.edu/%7Ebbl2/OoohEeeeh.gnaural \
	http://pantheon.yale.edu/%7Ebbl2/C.gnaural \
	http://pantheon.yale.edu/%7Ebbl2/subterranean.gnaural \
	http://pantheon.yale.edu/%7Ebbl2/AndromedaHell.gnaural \
	http://pantheon.yale.edu/%7Ebbl2/DesertWind.gnaural \
	http://pantheon.yale.edu/%7Ebbl2/CricketsAndFrogs.gnaural \
	http://pantheon.yale.edu/%7Ebbl2/mFunk.gnaural \
	http://pantheon.yale.edu/%7Ebbl2/Penfold.gnaural \
	http://pantheon.yale.edu/%7Ebbl2/MuthShip.gnaural \
	http://pantheon.yale.edu/%7Ebbl2/ToadsAndBugs.gnaural \
	http://pantheon.yale.edu/%7Ebbl2/CandyWreck.gnaural \
	http://pantheon.yale.edu/%7Ebbl2/BasicMeditation.gnaural \
	http://pantheon.yale.edu/%7Ebbl2/StudyTime.gnaural \
	doinst.sh)
md5sums=('d6e69e47bffb81c7d0b1cde59bbab96d'
         '9c8eb42982ad2e555bc96c2a28434a24'
         '7fe1d3272dc1d7fb19c79cb357774e42'
         'f6dc30ecf99a84d4014fc5fd18cc794f'
         'f49aa8456f5961a77aedad7ba9ad9251'
         'f55722259facde3fd56ccc5c76c5d6dc'
         'ba3899850f30738f098940b5c537b3ca'
         '9e19e0c3618811c8f75778c61ad90589'
         '6218ff11e3dac58eea04837b97f3bca5'
         '7cf1f00c7958bb4aa89d6320bb9a203f'
         '84308c19b4977105109f890a24730d4f'
         '9f4d5c284172221d72574809bd789a7b'
         '0a0306121af6f59bd5bc5b03c7c8dcc3'
         '57b243749d330ed09c8ceadc9cf8bbc8'
         '3376d47c9f764ea15664f19c0b2e471e'
         '8e8b31e8d178680161951348e1d04eba'
         'e01d2bf247b4488bfa02df9847869bbb'
         '11e2e044c4049006e024b42ccfc7996f'
         '79b991e6e2cb0b26b6c52c7732a1cc35'
         '58d55bcc9093a4147fdb686e969a21a5')

build() {
  install -m755 -D doinst.sh $pkgdir/usr/share/gnaural2/schedule/doinst.sh
  cp -f *.gnaural $pkgdir/usr/share/gnaural2/schedule/
}

# vim:set ts=2 sw=2 et:

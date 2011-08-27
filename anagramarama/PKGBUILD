# Contributor: Yumi Nanako <yumileroy [at] yahoo.com>

pkgname=anagramarama
pkgver=0.2
pkgrel=1
pkgdesc="Like anagrams? You'll love Anagramarama! The aim is to find as many words as possible in the time available. Get the longest word and you'll advance to the next level."
arch=('i686' 'x86_64')
url="http://www.coralquest.com/anagramarama/"
license=('GPL')
depends=('sdl' 'sdl_mixer')
source=(http://www.omega.clara.net/anagramarama/dist/$pkgname-$pkgver.tar.gz
	$pkgname.desktop
	${pkgname}_${pkgver}-1.diff)
md5sums=('6dcd8dc515f9c69df8a19119c04d9517' '96e970698f2c8da8376ad599e43057ea' '49ed05b727ce09ea15befcf4e278f885')

build() {
  cd $srcdir/
  patch -p0 -i ${pkgname}_${pkgver}-1.diff
  cd "$srcdir/$pkgname"

  make || return 1
  mkdir -p ${startdir}/pkg/usr/bin/
  mkdir -p ${startdir}/pkg/usr/share/anagramarama
  mkdir -p ${startdir}/pkg/usr/share/anagramarama/audio
  mkdir -p ${startdir}/pkg/usr/share/anagramarama/images
  mkdir -p ${startdir}/pkg/usr/share/applications
  mkdir -p ${startdir}/pkg/usr/share/man/man6

  install -m 755 anagramarama ${startdir}/pkg/usr/bin
  install -m 644 wordlist.txt ${startdir}/pkg/usr/share/anagramarama
  install -m 644 audio/badword.wav audio/click-answer.wav audio/clock-tick.wav audio/found.wav audio/shuffle.wav audio/clearword.wav audio/click-shuffle.wav audio/duplicate.wav audio/foundbig.wav ${startdir}/pkg/usr/share/anagramarama/audio
  install -m 644 images/background-al.bmp  images/background-old.bmp  images/background.bmp  images/letterBank.bmp  images/numberBank.bmp  images/smallLetterBank.bmp ${startdir}/pkg/usr/share/anagramarama/images
  gzip -9 anagramarama.6
  install -m 644 anagramarama.6.gz ${startdir}/pkg/usr/share/man/man6
  install -m 644 ${startdir}/$pkgname.desktop ${startdir}/pkg/usr/share/applications/anagramarama.desktop
}


#Contributor: Dan Serban (dserban01 => gmail)
pkgname=recordwhatyouhear
pkgver=0.0.1
pkgrel=1
pkgdesc="Record all audio output from your computer's sound card into a WAV file in /tmp"
arch=('i686' 'x86_64')
url="http://grangerx.wordpress.com/2009/08/03/fedora-11-recording-audio-from-pulseaudio-using-parec-and-sox/"
license=('GPLv3')
depends=('pulseaudio' 'pulseaudio-alsa' 'sox' 'xterm')
source=('recordwhatyouhear' 'recordwhatyouhear.sh')
md5sums=('055fe94236d122e36edb7b85e3ce26b8' '2a314c782ad45afbb9e6699612c84cee')

build()
{
  install -D -m755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
  install -D -m755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname.sh
}

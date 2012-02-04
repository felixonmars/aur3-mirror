# Contributor: Dan Serban

pkgname=outrec-workalike
pkgver=0.0.1
pkgrel=1
pkgdesc="Record all audio output from your computer's sound card into a WAV file in /tmp"
arch=(any)
url="http://grangerx.wordpress.com/2009/08/03/fedora-11-recording-audio-from-pulseaudio-using-parec-and-sox/"
license=(GPLv3)
depends=(pulseaudio pulseaudio-alsa sox xterm)
source=('outrec-workalike' 'outrec-workalike.sh')
md5sums=('dca766278614c846594647233621c9d5'
         '2a314c782ad45afbb9e6699612c84cee')

build()
{
  install -D -m755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -D -m755 $pkgname.sh "$pkgdir/usr/bin/$pkgname.sh"
}

# Maintainer:
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Daenyth <Daenyth [at] aur [dot] archlinux [dot] org>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Daniel Funke <daniel.funke@ieee.org>

pkgname=lastfmsubmitd
pkgver=1.0.6
pkgrel=9
pkgdesc='Last.fm plugin client for MPD, implemented in Python'
arch=('any')
url='http://www.red-bean.com/decklin/lastfmsubmitd/'
license=('MIT')
depends=('python2-mpdclient2')
makedepends=('python2')
optdepends=('mpd: For local audio playback')
source=(http://www.red-bean.com/decklin/$pkgname/$pkgname-$pkgver.tar.gz
	lastmp.conf
	lastfmsubmitd.conf
        lastmp.service
        lastfmsubmitd.service
        lastfmsubmitd.tmpfiles)
md5sums=('eadf6f8a7c3a5f8b6311a6fae5c117f6'
         'f331cb1fca46eb0b91be269babe49224'
         'c1ed7a40539e67998513968a9d8c6007'
         'dbab0ea86bf7e07899f3df4b208554ea'
         'bd7520ef54b296b7ddfef6916801adf6'
         '0439ad3cb820dabf9b2e4f4f453e88cf')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's#/usr/bin/python#/usr/bin/python2#' contrib/lastmp lastfmsubmit lastfmsubmitd
}

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --prefix="$pkgdir"/usr --optimize=1

  install -D -m 600 -o $USER "$srcdir"/lastfmsubmitd.conf "$pkgdir"/home/$USER/.lastfmsubmitd/conf
  install -D -m 600 -o $USER "$srcdir"/lastmp.conf "$pkgdir"/home/$USER/.lastmp/conf

  install -D -m 644 "$srcdir"/lastmp.service "$pkgdir"/usr/lib/systemd/user/lastmp.service
  install -D -m 644 "$srcdir"/lastfmsubmitd.service "$pkgdir"/usr/lib/systemd/user/lastfmsubmitd.service
  install -D -m 644 "$srcdir"/lastfmsubmitd.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/lastfmsubmitd.conf

  install -D -m 755 contrib/lastmp "$pkgdir"/usr/bin/lastmp
  install -D -m 644 doc/lastmp.1 "$pkgdir"/usr/share/man/man1/lastmp.1

  install -d "$pkgdir"/var/log/lastfm
  install -d "$pkgdir"/var/spool/lastfm
  install -d "$pkgdir"/var/cache/lastfm
  install -D -m644 README "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:

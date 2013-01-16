# Maintainer: TDY <tdy@archlinux.info>

pkgname=encode-prog
pkgver=0.1
pkgrel=1
pkgdesc="A script for transcoding video files to fixed-size MPEG4 with Vorbis audio"
arch=('i686' 'x86_64')
url="http://offog.org/code/misccode.html"
license=('MIT')
depends=('bash' 'mkvtoolnix' 'mplayer' 'python2' 'vorbis-tools')
source=(http://offog.org/darcs/misccode/$pkgname
        http://offog.org/darcs/misccode/NOTES)
md5sums=('8fda3e9308f45039dc03b1934336c407'
         'f1a4f370d7a9bfb025a38065631141fb')

package() {
  cd "$srcdir"
  sed '1,16 d' <NOTES >LICENSE
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  sed -i 's/python/&2/g' "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:

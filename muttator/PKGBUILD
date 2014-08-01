# Contributor: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Dave Nguyen <diendien@gmail.com>
pkgname=muttator
license=("MIT")
pkgver=1.2
pkgrel=1
pkgdesc="Make Thunderbird look and behave like Vim"
arch=('any')
url="http://vimperator.org/muttator"
depends=("thunderbird>=17")
_extensionId="muttator@mozdev.org"
_fileName=muttator-$pkgver-tb.xpi
source=("https://addons.mozilla.org/thunderbird/downloads/file/230596/$_fileName")
md5sums=('126b6ad483e452e46e61ce4814c86169')
conflicts=('muttator-hg')

package() {
  cd $srcdir || return 1
  local dstdir=$pkgdir/usr/lib/thunderbird/extensions/$_extensionId
  install -d $dstdir || return 1
  cp -R * $dstdir || return 1
  rm $dstdir/$_fileName
}

# Maintainer: botika  <aritmeeul at gmail dot com>
pkgname=irssi-scripts-git
_gitname=scripts.irssi.org
pkgver=r143.03534f1
pkgrel=1
pkgdesc="Collections of scripts for irssi from scripts.irssi.org"
arch=(i686 x86_64)
url="http://scripts.irssi.org"
license=('various')
depends=('irssi' 'perl')
makedepends=('git')
source=("git+https://github.com/irssi/scripts.irssi.org")
md5sums=("SKIP")

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p tmp
  tmpfile=$(TMPDIR="$srcdir/$_gitname/tmp" mktemp)
  pacman -Ql irssi|awk '$2~/usr\/share\/irssi\/scripts\/.*\.pl/{print $2}' > $tmpfile
  install -D -d "$pkgdir/usr/share/irssi/scripts"
  cp -a scripts/*.pl "$pkgdir/usr/share/irssi/scripts"
  cd $pkgdir
  find . -name "*.pl"|grep -f $tmpfile|xargs -n1 rm
}

# vim:set ts=4 sw=2 et:

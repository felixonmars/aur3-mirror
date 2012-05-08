# Maintainer: Michael Eckert <michael.eckert@linuxmail.org>
pkgname=mrepo-git
pkgver=20120508
pkgrel=2
pkgdesc="RPM repository management tool supporting ftp/http/sftp/rsync/rhn/you"
arch=('i386', 'x86_64')
url="http://dag.wieers.com/home-made/mrepo/"
license=('GPL')
depends=('python2' 'python2-pyopenssl' 'createrepo')
makedepends=('git')
provides=('mrepo')
source=('mrepo.patch')
md5sums=('137505bdfe8489c1bbfc51043665ea15')

_gitroot='https://github.com/dagwieers/mrepo.git'
_gitname='mrepo'

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  
  patch -p0 < $srcdir/mrepo.patch

}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" localstatedir="/srv" wwwdir="/srv/http/mrepo" cachedir="/var/cache/mrepo" install
  chmod 0644 $pkgdir/etc/mrepo.conf
  chmod 0755 $pkgdir/etc/mrepo.conf.d
}

# vim:set ts=2 sw=2 et:

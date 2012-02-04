# Maintainer: Igor Nemilentsev <trezorg@gmail.com>
pkgname=gitweb-git
pkgver=20100629
pkgrel=1
pkgdesc="web gui for the fast distributed version control system"
arch=(any)
url="http://git-scm.com/"
license=('GPL2')
depends=('perl>=5.10.0')
makedepends=('git' 'autoconf')
provides=(gitweb)
conflicts=(gitweb)
source=(gitweb.conf)
backup=(etc/gitweb.conf)
md5sums=('cc92fddd462349512d9066a7b6154cc6')

_gitroot="git://git.kernel.org/pub/scm/git/git.git"
_gitname="git_git"

build() {
  cd $srcdir
  if [[ -d $_gitname ]]; then
  (cd $_gitname && git pull origin)
  else
  echo ok
  git clone $_gitroot $_gitname
  fi
  cd $_gitname

  make configure || return 1

  ./configure --prefix=/usr || return 1

  make gitweb/gitweb.cgi || return 1
}

package() {
  cd $srcdir/$_gitname/${pkgname%-git}/static

  for F in gitweb.css gitweb.js git-logo.png git-favicon.png ; do
    install -Dm644 $F $pkgdir/srv/http/gitweb/$F || return 1
  done
  cd ..
    install -Dm755 gitweb.cgi $pkgdir/srv/http/gitweb || return 1
    install -Dm644 README $pkgdir/usr/share/doc/gitweb/README || return 1
    install -Dm644 INSTALL $pkgdir/usr/share/doc/gitweb || return 1
    install -Dm644 $srcdir/gitweb.conf $pkgdir/etc/gitweb.conf || return 1
}

# vim:set ts=2 sw=2 et:

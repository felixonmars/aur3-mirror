# Contributor: Andreas B. Wagner <AndreasBWagner@gmail.com>
pkgname=dmc-hg
pkgver=81
pkgrel=2
pkgdesc="dynamic mail client"
arch=('i686' 'x86_64')
url="http://hg.suckless.org/dmc/"
license=('MIT')
depends=('msmtp' 'openssl')
makedepends=('mercurial')
provides=('dmc')
conflicts=('dmc')

_hgroot="http://hg.suckless.org/"
_hgrepo="dmc"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u || return 1
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo || return 1
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  make all HAVE_SSL=1 PREFIX=/usr || return 1
  #make LDFLAGS="--no-as-needed" all || return 1
}
package() {
  cd "$srcdir/$_hgrepo-build"
  make install DESTDIR="$pkgdir" || return 1
  install -Dm644 README ${pkgdir}/usr/share/doc/${pkgname}/README
  install -Dm644 HISTORY ${pkgdir}/usr/share/doc/${pkgname}/HISTORY
  install -Dm644 TODO ${pkgdir}/usr/share/doc/${pkgname}/TODO
  install -Dm644 FAQ ${pkgdir}/usr/share/doc/${pkgname}/FAQ
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
} 
# vim:set ts=2 sw=2 et:

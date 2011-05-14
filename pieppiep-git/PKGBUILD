# Maintainer: Christoph Stahl <christoph.stahl@udo.edu>
pkgname=pieppiep-git
_pkgname=Pieppiep
pkgver=20110514
pkgrel=1
pkgdesc="Pieppiep is a Twitterclient for your Terminal, written (mostly) in Bash."
url="http://opensomething.org/pieppiep"
arch=( 'any' )
license=( 'custom' )
depends=( 'bash' 'perl-json' 'perl' 'openssl')
provides=('pieppiep')
makedepends=('git')

build() {
  cd "$srcdir"
  if [[ -d $_pkgname ]]; then
    cd $_pkgname && git pull origin && cd ..
  else
    git clone git://github.com/simonszu/$_pkgname.git  
  fi
}

package() {
  cd "$srcdir/$_pkgname"  || return 1
  install -D -m755 TwitterOAuth.sh $pkgdir/usr/bin/TwitterOAuth.sh || return 1
  install -D -m755 OAuth.sh $pkgdir/usr/bin/OAuth.sh || return 1
  install -D -m755 ppperljson $pkgdir/usr/bin/ppperljson || return 1
  install -D -m755 pieppiep $pkgdir/usr/bin/pieppiep || return 1
}

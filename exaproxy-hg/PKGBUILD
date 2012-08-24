# Maintainer: Seblu

pkgname=exaproxy-hg
pkgver=665
pkgrel=1
pkgdesc='simple non-caching proxy able to transform requests on the fly'
arch=(any)
url='http://code.google.com/p/exaproxy/'
license=('custom: BSD')
depends=('python2')
makedepends=('mercurial')

_hgroot=http://code.google.com/p/exaproxy
_hgrepo=exaproxy

build() {
  msg "Connecting to Mercurial server...."

  if (( NOEXTRACT == 0 )); then
    if [[ -d "$_hgrepo" ]]; then
      cd "$_hgrepo"
      hg pull -u
    else
      hg clone "$_hgroot" "$_hgrepo"
      cd "$_hgrepo"
    fi
  else
    cd "$_hgrepo"
  fi
  # arch python2
  ls
  find etc sbin lib -type f -exec \
    sed -i '1s,^#!/usr/bin/\(env \|\)python$,#!/usr/bin/python2,' {} \; -print
  # remove pyc
  find etc sbin lib -name '*.pyc' -delete
}

package() {
  ls
  cd exaproxy
  install -dm 755 "$pkgdir/usr"
  cp -a etc "$pkgdir"
  cp -a sbin lib "$pkgdir/usr"
  install -Dm 644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
  #cp -r exaproxy "$pkgdir/opt"
  #chmod -R u=rwX,go=rX "$pkgdir/opt/exaproxy"
}

# vim:set ts=2 sw=2 et:

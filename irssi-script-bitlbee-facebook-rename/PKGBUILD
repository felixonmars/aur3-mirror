# Maintainer: Tom Vincent <http://tlvince.com/contact/>
pkgname=irssi-script-bitlbee-facebook-rename
_name=facebook_bitlbee_rename.pl
pkgver=20120225
pkgrel=1
pkgdesc="Rename Facebook numeric nicks to sensible names"
arch=(any)
url="https://github.com/avar/irssi-bitlbee-facebook-rename"
license=('GPL')
depends=('perl-text-unidecode')
options=(!emptydirs)

_gitroot=git://github.com/avar/$pkgname
_gitname=$pkgname

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
}

package() {
  cd "$srcdir/$pkgname"
  install -D -d "$pkgdir/usr/share/irssi/scripts"
  cp "$_name" "$pkgdir/usr/share/irssi/scripts"
}

# vim:set ts=2 sw=2 et:

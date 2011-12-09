# Maintainer: Calvin McAnarney <calvin@mcanarney.org>
pkgname=prosody-auth-dovecot-hg
pkgver=501
pkgrel=1
pkgdesc="Dovecot authentication module for prosody"
arch=('i686' 'x86_64')
url="http://code.google.com/p/prosody-modules"
license=('MIT')
depends=('prosody')
makedepends=('mercurial')

_hgroot=https://prosody-modules.googlecode.com/hg
_hgrepo=prosody-modules

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [[ -d "$_hgrepo" ]]; then
    cd "$_hgrepo"
    hg pull -u
    msg "The local files are updated."
  else
    hg clone "$_hgroot" "$_hgrepo"
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"
}

package() {
  cd "$srcdir/$_hgrepo-build"
  install -D "mod_auth_dovecot/auth_dovecot/mod_auth_dovecot.lua" "$pkgdir/usr/lib/prosody/modules/mod_auth_dovecot.lua"
  install -D "mod_auth_dovecot/auth_dovecot/sasl_dovecot.lib.lua" "$pkgdir/usr/lib/prosody/modules/sasl_dovecot.lib.lua"
}

# vim:set ts=2 sw=2 et:

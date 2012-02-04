# Maintainer: Julian Brost <julian.brost@googlemail.com>
pkgname=google-authenticator-libpam-hg
pkgver=93
pkgrel=1
pkgdesc="PAM module for HOTP and TOTP authentication"
arch=('i686' 'x86_64')
url="http://code.google.com/p/google-authenticator/"
license=('APACHE')
groups=()
depends=('pam')
optdepends=('qrencode: Generating QR-Codes for scanning on your smartphone')
makedepends=('mercurial' 'subversion')
provides=('google-authenticator-libpam')
conflicts=('google-authenticator-libpam')
replaces=()
backup=()
options=()
install=$pkgname.install
source=()
noextract=()
md5sums=()

_hgroot="https://google-authenticator.googlecode.com/hg/"
_hgrepo="google-authenticator"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo
  fi

  msg "Mercurial checkout done or server timeout"

  msg "Preparing build directory"
  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build/libpam"

  msg "Starting make..."
  make
}

package() {
  cd "$srcdir/$_hgrepo-build/libpam"
  install -D -m755 pam_google_authenticator.so $pkgdir/lib/security/pam_google_authenticator.so
  install -D -m755 google-authenticator $pkgdir/usr/bin/google-authenticator
} 

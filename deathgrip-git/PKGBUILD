

# Maintainer: "Super" Nathan Weber <supernathansunshine@gmail.com>
pkgname=deathgrip-git
pkgver=20130608
pkgrel=1
pkgdesc="Cryptography program for plain text"
arch=('i686' 'x86_64')
url="git://github.com/super-nathan/deathgrip.git"
license=('GPL')
depends=('python')
makedepends=('git')
provides=(deathgrip)
conflicts=(deathgrip)
source=('git://github.com/super-nathan/deathgrip.git')
md5sums=('SKIP')

_gitname=deathgrip
_gitroot='git://github.com/super-nathan/deathgrip.git'


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

  rm -rf "$srcdir/{$_gitname}-build"
  git clone "$srcdir/$_gitname" "$srcdir/{$_gitname}-build"
  cd "$srcdir/{$_gitname}-build"
  gzip deathgrip.1
}

package() {
	cd "$srcdir/{$_gitname}-build"
	mkdir -p ${pkgdir}/usr/bin
    cp deathgrip ${pkgdir}/usr/bin/deathgrip
    mkdir -p ${pkgdir}/usr/share/man/man1
    cp deathgrip.1.gz ${pkgdir}/usr/share/man/man1/deathgrip.1.gz
    mkdir -p ${pkgdir}/etc
    cp deathgrip.conf ${pkgdir}/etc/deathgrip.conf
}

# vim:set ts=2 sw=2 et:

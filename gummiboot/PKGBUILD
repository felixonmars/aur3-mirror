# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=gummiboot
pkgver=6
pkgrel=1
pkgdesc="A very simple boot manager for UEFI"
arch=('x86_64')
url="http://freedesktop.org/wiki/Software/gummiboot"
license=('GPL')
optdepends=('efibootmgr: for adding Gummiboot to the UEFI boot menu')
makedepends=('gnu-efi')
install="$pkgname.install"

_gitrepo='git://anongit.freedesktop.org/gummiboot'
_gitname='gummiboot'
#_gitref="master"
_gitref="49d4ae4e4258d7647f221a58df3375ac2957a8dc" # v6

build() {
  cd "$srcdir"
  if [[ -d $_gitname ]]; then
    (cd "$_gitname" && git pull origin)
  else
    git clone "$_gitrepo" "$_gitname"
  fi

  rm -rf "$_gitname-build"
  git clone -s "$_gitname" "$_gitname-build"
  cd "$_gitname-build"
  git checkout -q "$_gitref"

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  install -Dm0644 "gummiboot.efi" "$pkgdir/usr/lib/gummiboot/gummiboot.efi"
}

# vim:set ts=2 sw=2 et:

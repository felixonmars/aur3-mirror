# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=gummiboot-efi-x86_64
pkgver=6
pkgrel=2
pkgdesc="A very simple boot manager for UEFI"
arch=('x86_64')
url="http://freedesktop.org/wiki/Software/gummiboot"
license=('GPL')
optdepends=('efibootmgr: for adding Gummiboot to the UEFI boot menu')
makedepends=('git' 'gnu-efi')
install=gummiboot.install
source=('arch.conf'
        'default.conf')
sha1sums=('dedbcfb539100b20cee9b5800cfbc84a6bdacb93'
          '191504db923ee574941de876093d80eb423d3630')

_gitrepo='git://anongit.freedesktop.org/gummiboot'
_gitname='gummiboot'
_gitref='6' # tag=$pkgver

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

  # build

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  install -Dm0644 gummiboot.efi "$pkgdir/usr/lib/gummiboot/gummiboot.efi"

  cd "$srcdir"
  install -Dm0644 default.conf  "$pkgdir/usr/share/doc/gummiboot/default.conf"
  install -Dm0644 arch.conf     "$pkgdir/usr/share/doc/gummiboot/entries/arch.conf"
  # For consistency, arch.conf was named according to /etc/os-release.
}

# vim:set ts=2 sw=2 et:

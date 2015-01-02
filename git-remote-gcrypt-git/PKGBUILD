pkgname=git-remote-gcrypt-git
_gitname=git-remote-gcrypt
pkgver=20150101
pkgrel=1
pkgdesc="GNU Privacy Guard-encrypted git remote."
arch=(i686 x86_64)
url="https://github.com/Azulinho/git-remote-gcrypt"
license=('GPL')
depends=()
makedepends=('git' 'python-docutils' 'gzip' 'coreutils')
source=(git://github.com/Azulinho/git-remote-gcrypt.git)
sha1sums=(SKIP)

pkgver() {
  cd "$_gitname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

package() {
  cd "$_gitname"

  install -m 755 -D git-remote-gcrypt $pkgdir/usr/bin/git-remote-gcrypt

  rst2man ./README.rst | gzip -9 > git-remote-gcrypt.1.gz
  install -m 644 -D git-remote-gcrypt.1.gz $pkgdir/usr/share/man/man1/git-remote-gcrypt.1.gz
}

# vim:set ts=2 sw=2 et:

# Maintainer: Trustin Lee <t@motd.kr>
# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=cuetools-git
_basename=cuetools
pkgver=20131014.251
pkgrel=2
pkgdesc="Set of utilities for working with cue files and toc files"
arch=('i686' 'x86_64')
url="http://developer.berlios.de/projects/cuetools/"
license=('GPL')
depends=('glibc')
makedepends=('bison' 'autoconf')
conflicts=('cuetools')
source=('git+https://github.com/svend/cuetools.git' \
        'unicode.diff')
sha1sums=('SKIP' \
          'e1fae16b519d481d2dc8e08743c6b27f723dda3f')

pkgver() {
  cd "$_basename"
  echo $(date --utc --date="@`git show -s --format='%ct'`" '+%Y%m%d').$(git rev-list --count HEAD)
}

build() {
  cd "$_basename"

  patch -Np1 < "$srcdir/unicode.diff"

  rm -fr m4
  mkdir -p m4
  aclocal
  autoheader
  autoconf
  automake -a -c

  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$_basename"

  make DESTDIR="$pkgdir" install
  #install -m755 extras/cuetag.sh "$pkgdir"/usr/bin/cuetag.sh
}

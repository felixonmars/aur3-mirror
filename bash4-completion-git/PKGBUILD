# $Id$
##Git variant:
# Maintainer: Anton Bobrov <bobrov@vl.ru>
##Original package:
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>
# Contributor: Evangelos Foutras <foutrelis@gmail.com>

pkgname=bash4-completion-git
pkgver=20090826
pkgrel=1
pkgdesc="Programmable completion for the bash shell, git version. Fixes bash4 scp completion bug"
arch=(i686 x86_64)
url="http://bash-completion.alioth.debian.org/"
license=('GPL')
depends=('bash')
makedepends=('git')
conflicts=('bash-completion')
provides=('bash-completion')

source=('scp-complete.patch')
md5sums=('fd25c10b506a7510fd48ccb8b5a1bd41')

_gitroot="git://git.debian.org/git/bash-completion/bash-completion.git"
_gitname="bash-completion"

build() {
  cd ${srcdir}
  msg "Connecting to btt.home.nz GIT server...."

  if [ -d "${srcdir}/$_gitname" ] ; then
    cd "$_gitname" && git fetch origin || return 1
    msg "The local files are updated."
  else
    git clone --depth=1 "$_gitroot" "$_gitname" || return 1
  fi

  cd "$srcdir/$_gitname"
  git archive --format=tar --prefix=$_gitname-build/ HEAD | ( cd .. && tar xf - )

  msg "GIT checkout done or server timeout"

  cd "$srcdir/$_gitname-build"

  patch -p1 -i ../scp-complete.patch

  # fixes for archlinux
  sed -i 's#/sbin/lsmod#/bin/lsmod#' bash_completion || return 1

  ./autogen.sh || return 1
  ./configure --prefix=/usr --sysconfdir=/etc || return 1
  make || return 1
  make DESTDIR="$pkgdir" install

  # apache2ctl doesn't work, even when renamed to apachectl (and sed'd)
  rm "$pkgdir/etc/bash_completion.d/apache2ctl"

  install -Dm755 bash_completion.sh "$pkgdir/etc/profile.d/bash_completion.sh"

  rm -fr "$srcdir/$_gitname-build"
}
# vim:set ts=2 sw=2 et:

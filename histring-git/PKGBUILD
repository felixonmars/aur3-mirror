# Contributor: Rick W. Chen <stuffcorpse@archlinux.us>

pkgname=histring-git
pkgver=20110410
pkgrel=1
pkgdesc="highlight strings using ANSI terminal escape sequences"
arch=(i686 x86_64)
url="http://www.debian-administration.org/article/Highlighting_strings_in_text_output_with_histring"
license=('GPL')
depends=('glibc')
makedepends=('git')
provides=('histring')

source=('extrasrc_not_allowed.patch')
sha1sums=('241c55efc4a1c89061b0cf7b291101d1e130739f')
md5sums=('8e5f8c290e54a6395b366e6ff146e7b1')

_gitroot="git://git.grml.org/histring.git"
_gitname="histring"

build() {
  cd ${srcdir}
  msg "Connecting to grml GIT server...."

  if [ -d "${srcdir}/$_gitname" ] ; then
    cd "$_gitname" && git fetch origin && cd "${srcdir}"
    msg "The local files are updated."
  else
    git clone --mirror "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  if [ -d "${srcdir}/$_gitname-build" ] ; then
    rm -fr "${srcdir}/$_gitname-build"
  fi

  git clone -l "$_gitname" "$_gitname-build"
  cd "${srcdir}/$_gitname-build"

  git apply ${srcdir}/extrasrc_not_allowed.patch
  automake -a -c || true
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/$_gitname-build"
  make DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et:

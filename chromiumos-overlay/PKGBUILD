# Maintainer: Thomas Sowell <tom@fancydriving.org>

buildarch=1

pkgname=chromiumos-overlay
pkgdesc="Chromium OS Build Configuration"
pkgver=R30.4537
pkgrel=1
arch=('any')
groups=('chromarchy')
url="http://git.chromium.org/gitweb/?p=chromiumos/overlays/chromiumos-overlay.git;a=summary"
license=('custom:chromiumos')
_gitroot=http://git.chromium.org/chromiumos/overlays/chromiumos-overlay.git
_gitver=heads/release-R30-4537.B
_gitname='chromeos-overlay'
makedepends=('git')

source=(LICENSE)

md5sums=('87dd8458232da630f5617873d42d8350')

prepare() {
  cd "$startdir"
  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git reset --hard FETCH_HEAD
  else
    mkdir -p "$_gitname"
    cd "$_gitname"
    git init
    git remote add origin "$_gitroot"
    git fetch origin "$_gitver" --depth 1
    git reset --hard FETCH_HEAD
  fi

  rm -fr "$srcdir/$_gitname"
  cp -r "$startdir/$_gitname" "$srcdir/$_gitname"
  rm -fr "$srcdir/$_gitname/.git" "$srcdir/$_gitname/.gitignore"
}

package() {
  cd "$srcdir"

  install -d ${pkgdir}/usr/share
  cp -r ${srcdir}/${_gitname} ${pkgdir}/usr/share/chromiumos-overlay

  install -m 644 -D ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

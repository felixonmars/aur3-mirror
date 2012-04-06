# Maintainer: Alucryd <alucryd at gmail dot com>
pkgname=gnome-shell-extension-focus-effects-git
pkgver=20120406
pkgrel=1
pkgdesc="Add custom effects on window focus/blur in Gnome Shell"
arch=('any')
url="https://github.com/paradoxxxzero/gnome-shell-focus-effects-extension"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')

_gitroot="https://github.com/paradoxxxzero/gnome-shell-focus-effects-extension.git"
_gitname="gnome-shell-extension-focus-effects-extension"

build() {
  cd "${srcdir}"
  msg "Connecting to the GIT server..."
  if [[ -d "${srcdir}/${_gitname}" ]] ; then
    cd "${_gitname}"
    git pull origin
    msg "The local files are updated..."
  else
    git clone "${_gitroot}" "${_gitname}"
    cd "${_gitname}"
  fi
  msg "GIT checkout done."
}

package() {
  cd "$srcdir/${_gitname}/focus-effects@paradoxxx.zero.gmail.com"
  sed -i 's|3.2|3.4|g' metadata.json
  install -D -m 644 extension.js "$pkgdir/usr/share/gnome-shell/extensions/focus-effects@paradoxxx.zero.gmail.com/extension.js"
  install -D -m 644 metadata.json "$pkgdir/usr/share/gnome-shell/extensions/focus-effects@paradoxxx.zero.gmail.com/metadata.json"
  install -D -m 644 ../example.ffxrc.json "$pkgdir/usr/share/gnome-shell/extensions/focus-effects@paradoxxx.zero.gmail.com/example.ffxrc.json"
}


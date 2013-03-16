# Maintainer: Ebenezer Edelman <contact@EbenezerEdelman.tk>

pkgname=gnome-shell-extension-pidgin-git
pkgver=20130316
pkgrel=3
pkgdesc="Pidgin conversation integration for Gnome Shell 3.6."
arch=('any')
url="https://github.com/thedeadparrot/gnome-shell-extensions-pidgin"
groups=('gnome-shell-extensions')
license=('unknown')
depends=('gnome-shell>=3.6' 'pidgin')
makedepends=('git')
provides=('gnome-shell-extension-pidgin')
conflicts=('pidgin-gnome-shell-extension-git')

_gitroot="$url.git"
_gitname="gnome-shell-extensions-pidgin"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout."
}

_installdir="$pkgdir/usr/share/gnome-shell/extensions/pidgin-conversation-integration@kagesenshi.org"

package() {
  cd "$srcdir/$_gitname"
  install -Dm644 metadata.json "$_installdir/metadata.json"
  install -Dm644 extension.js "$_installdir/extension.js"
}

# vim:set ts=2 sw=2 et:

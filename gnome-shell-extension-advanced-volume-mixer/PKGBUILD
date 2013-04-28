# Submitter: Gen2ly <toddrpartridge@gmail.com>

pkgname=gnome-shell-extension-advanced-volume-mixer
pkgver=3.8
pkgrel=1
pkgdesc="Adds volume control of programs to volume mixer"
arch=('any')
url="https://extensions.gnome.org/extension/212/advanced-volume-mixer/"
license=('unknown')
depends=('gnome-shell')

_gitroot="http://repo.or.cz/r/AdvancedVolumeMixer.git"
_gitname="AdvancedVolumeMixer"

build() {
  msg "Connecting to GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
}

package() {
  ext_dir="$pkgdir/usr/share/gnome-shell/extensions/AdvancedVolumeMixer@harry.karvonen.gmail.com"
  install -d "$ext_dir"
  cd $srcdir/$_gitname
  install -Dm644 extension.js   "$ext_dir"/extension.js
  install -Dm644 metadata.json  "$ext_dir"/metadata.json
  install -Dm644 stylesheet.css "$ext_dir"/stylesheet.css
}

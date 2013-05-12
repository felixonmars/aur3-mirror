# Maintainer:  zsy <zsy056 at gmail dot com>

pkgname=gnome-shell-extension-brightness-pulbs-git
pkgver=20130512
pkgrel=1
pkgdesc="Brightness Control, a Gnome Shell extension"
arch=('any')
url="http://gitorious.org/~pulb/gnome-shell-brightness-extension/pulbs-gnome-shell-brightness-extension"
groups=('gnome-shell-extensions')
license=('GPL3')
depends=('gnome-shell')

_gitroot="https://git.gitorious.org/~pulb/gnome-shell-brightness-extension/pulbs-gnome-shell-brightness-extension.git"
_gitname="pulbs-gnome-shell-brightness-extension"

build() {
    msg "Connecting to GIT server..."

    if [ -d $startdir/src/$_gitname ]; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot
    fi

    msg "GIT checkout done or server timeout"
}


package() {
    cd $srcdir/$_gitname
    _extpath="$pkgdir/usr/share/gnome-shell/extensions"
    _extname="brightness_control@lmedinas.org"
    install -Dm644 "$_extname/README" "$_extpath/$_extname/README"
    install -Dm644 "$_extname/COPYING" "$_extpath/$_extname/COPYING"
    install -Dm644 "$_extname/convenience.js" "$_extpath/$_extname/convenience.js"
    install -Dm644 "$_extname/extension.js" "$_extpath/$_extname/extension.js"
    install -Dm644 "$_extname/metadata.json" "$_extpath/$_extname/metadata.json"
    install -Dm644 "$_extname/prefs.js" "$_extpath/$_extname/prefs.js"
    install -Dm644 "$_extname/schemas/gschemas.compiled" "$_extpath/$_extname/schemas/gschemas.compiled"
    install -Dm644 "$_extname/schemas/org.gnome.shell.extensions.brightness_control.gschema.xml" "$_extpath/$_extname/schemas/org.gnome.shell.extensions.brightness_control.gschema.xml"
    install -Dm644 "$_extname/locale/locale_fr_LC_MESSAGES_gnome-shell-extension-brightness-control.mo" "$_extpath/$_extname/locale/locale_fr_LC_MESSAGES_gnome-shell-extension-brightness-control.mo"
    install -Dm644 "$_extname/locale/locale_fr_LC_MESSAGES_gnome-shell-extension-brightness-control.po" "$_extpath/$_extname/locale/locale_fr_LC_MESSAGES_gnome-shell-extension-brightness-control.po"
}

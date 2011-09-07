# Maintainer: Florian Mounier aka paradoxxxzero <paradoxxx.zero@gmail.com>
pkgname=gnome-shell-3.0-system-monitor-applet-git
pkgver=20110905
pkgrel=1
pkgdesc="System monitor extension for Gnome-Shell 3.0 (display mem swap cpu usage)"
arch=('any')
url="http://github.com/paradoxxxzero/gnome-shell-system-monitor-applet"
license=('GPL3')
depends=('gnome-shell' 'py3gobject' 'libgtop')
makedepends=('git')
provides=("system-monitor-applet")
install=('gschemas.install')

_gitroot="git://github.com/paradoxxxzero/gnome-shell-system-monitor-applet.git"
_gitname="gnome-shell-system-monitor-applet"

build() {
    cd ${srcdir}/
    msg "Connecting to the GIT server..."
    if [[ -d ${srcdir}/${_gitname} ]] ; then
	cd ${_gitname}
        git pull origin
        msg "The local files are updated..."
    else
        git clone ${_gitroot} ${_gitname}
	cd ${_gitname}
    fi
    git checkout gnome-3.0
    msg "GIT checkout done."
}

package() {
    cd "$srcdir/gnome-shell-system-monitor-applet"
    mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/"
    cp -R "system-monitor@paradoxxx.zero.gmail.com" "$pkgdir/usr/share/gnome-shell/extensions"
    mkdir -p "$pkgdir/usr/share/glib-2.0/schemas"
    cp "org.gnome.shell.extensions.system-monitor.gschema.xml" "$pkgdir/usr/share/glib-2.0/schemas"
    mkdir -p "$pkgdir/usr/bin"
    cp "system-monitor-applet-config.py" "$pkgdir/usr/bin/system-monitor-applet-config"
    mkdir -p "$pkgdir/usr/share/applications"
    cp "system-monitor-applet-config.desktop" "$pkgdir/usr/share/applications"
}


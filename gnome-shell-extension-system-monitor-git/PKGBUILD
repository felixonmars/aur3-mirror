# Maintainer: Martin Lukeš <martin.meridius@gmail.com>
# Contributor: Martin Lukeš <martin.meridius@gmail.com>
pkgname=gnome-shell-extension-system-monitor-git
pkgver=31.r5.g59767af
pkgrel=1
pkgdesc="Gnome shell system-monitor extension"
arch=('any')
_gitname="gnome-shell-system-monitor-applet"
_gitroot="git://github.com/paradoxxxzero/${_gitname}.git"
url="https://github.com/paradoxxxzero/${_gitname}"
license=('GPL3')
depends=('libgtop' 'networkmanager')
makedepends=('git')
replaces=('gnome-shell-extension-system-monitor-git')
install='gschemas.install'
source=("$_gitroot")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  # cutting off "v" prefix that presents in the git tag
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_gitname"
	mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/"
	cp -R "system-monitor@paradoxxx.zero.gmail.com" "$pkgdir/usr/share/gnome-shell/extensions"
}


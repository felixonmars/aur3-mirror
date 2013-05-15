#Maintainer: Jason <jarryson at gmail dot com>

pkgname=gnome-shell-extension-notifications-alert-git
_pkgname=gnome-shell-notifications-alert
pkgver=52
pkgrel=1
pkgdesc="Paints the GNOME Shell user's menu icon red on notification"
arch=('any')
url="https://github.com/hackedbellini/Gnome-Shell-Notifications-Alert"
license=('GPL')
depends=('gnome-shell')
makedepends=('git')
groups=('gnome-shell-extensions')
install=notifications-alert.install
source=("${_pkgname}::git+https://github.com/hackedbellini/Gnome-Shell-Notifications-Alert.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir"/${_pkgname}
	git rev-list --count HEAD
	#git describe --always | sed 's/-/./g'
}

package() {
    cd "${srcdir}"/${_pkgname}

    uuid="notifications-alert-on-user-menu@hackedbellini.gmail.com"
    distdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"
    install -d ${distdir}

    for i in src/*; do
        install -m644 $i ${distdir}
    done

    cp "${startdir}/zh_CN.po" locale

    for i in locale/*.po; do
	mkdir -p ${pkgdir}/usr/share/${i%.*}/LC_MESSAGES/
	msgfmt $i -o \
	    ${pkgdir}/usr/share/${i%.*}/LC_MESSAGES/gnome-shell-notifications-alert.mo
    done
    
    install -Dm644 "schemas/org.gnome.shell.extensions.notifications-alert.gschema.xml" \
        "${pkgdir}/usr/share/glib-2.0/schemas/org.gnome.shell.extensions.notifications-alert.gschema.xml"
}

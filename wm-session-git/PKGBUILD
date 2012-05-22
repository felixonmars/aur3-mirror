# Contributor: Muhammed Uluyol <some-guy> (uluyol0 AT gmail DOT com)

pkgname=wm-session-git
# This can be changed to anything with -session at the end
_installname=wm-session
pkgver=20120522
pkgrel=1
pkgdesc="A session manager for standalone window managers"
arch=('any')
url="http://github.com/vmll/wm-session/"
license=('custom:ISC')
install="wm-session.install"
depends=()
makedepends=('git')
source=()
_gitroot="git://github.com/vmll/wm-session.git"
_gitname="wm-session"

# trick re-determining the build revision and, or entertain the hidden
# makepkg option --forcever, huh
if [ -z "$FORCE_VER" ]; then
    msg "Determining latest build revision..."
    FORCE_VER=$(date +%Y%m%d)
fi

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
	cd $_gitname && git pull origin
	msg "The local files are updated."
    else
	git clone $_gitroot
    fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

    install -d ${pkgdir}/etc/xdg/${_installname} || return 1
    install -d ${pkgdir}/usr/bin || return 1
    install -d ${pkgdir}/usr/share/licenses/${_gitname} || return 1
    install -m 644 ${_gitname}/config ${pkgdir}/etc/xdg/${_installname}/ || return 1
    install -m 755 ${_gitname}/${_gitname} ${pkgdir}/usr/bin/${_installname} || return 1
    install -m 755 ${_gitname}/${_gitname}-end ${pkgdir}/usr/bin/${_installname}-end || return 1
    install -m 644 ${_gitname}/LICENSE ${pkgdir}/usr/share/licenses/${_gitname} || return 1
}

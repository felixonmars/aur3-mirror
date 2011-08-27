# Contributor: Purch <purcher@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=synergy-plus-svn
pkgver=20100504
pkgrel=1
pkgdesc="Share a mouse and keyboard between several computers."
arch=('i686' 'x86_64')
license=('GPL')
url="http://code.google.com/p/synergy-plus"
makedepends=('subversion' 'cmake')
depends=('gcc-libs' 'libxtst' 'libsm' 'libxinerama' 'openssl')
backup=('etc/synergy.conf')
conflicts=('synergy')
provides=('synergy')
replaces=('synergy-plus-hg')
_svnurl="http://synergy-plus.googlecode.com/svn/trunk/"
_svnmod="synergy-plus-read-only"


build() {
cd ${srcdir}

msg "Connecting to googlecode.com svn server...."
svn checkout ${_svnurl} ${_svnmod}
msg "SVN checkout done or server timeout"

cd ${srcdir}/${_svnmod}

cmake -DCMAKE_INSTALL_PREFIX=/usr || return 1
make || return 1
make DESTDIR=${pkgdir} install

mkdir ${pkgdir}/etc
install -m644 conf/synergy.conf ${pkgdir}/etc/synergy.conf
} 

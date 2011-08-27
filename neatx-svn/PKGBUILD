# Contributor: Oluf Lorenzen <fink.arch-packages@mafia-server.net
# original PKGBUILD: Nicolas Doualot <packages@slubman.info>
# vim:set ts=2 sw=2 et:
pkgname=neatx-svn
pkgver=29
pkgrel=4
pkgdesc="A free NX server by google"
arch=('i686' 'x86_64')
url="http://code.google.com/p/neatx/"
license=('GPL')
depends=('nxserver' 'python-pexpect' 'python-simplejson' 'gnu-netcat' 'pygobject')
makedepends=('docutils')
replaces=('neatx')
optdepends=(
  'xorg-xdm: if you want to use KDE or GNOME session'
  'xterm: if you want console session'
)

_svntrunk=http://neatx.googlecode.com/svn/trunk/ 
_svnmod=neatx

install=neatx-svn.install
source=(constants.archlinux.patch)
noextract=()

build() {
  cd "$srcdir"

  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn revert -R .)
    (cd ${_svnmod} && svn -r ${pkgver} up)
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  cd ${srcdir}/${_svnmod} || return 1

  patch -i "$srcdir/constants.archlinux.patch" -p2 || return 1
  cd ${srcdir}/${_svnmod}/${_svnmod} || return 1

  ./autogen.sh
  ./configure --prefix=/usr --localstatedir=/var RST2HTML=/usr/bin/rst2html.py
  make || return 1
  make DESTDIR="$pkgdir/" install
  chmod 777 "$pkgdir/var/lib/neatx/sessions"
  mkdir -p $pkgdir/usr/etc
  cp -n ${srcdir}/${_svnmod}/${_svnmod}/doc/neatx.conf.example $pkgdir/usr/etc/neatx.conf
}

md5sums=('26bec5187a85d7859317d30128f139a3')
sha256sums=('a52ff9c7c61c3ed016d215ac6b7c7b64711c271216fe892289824b7127320baf')

# Contributor: Tom Vincent <http://www.tlvince.com/>

pkgname=netcfgfx-git
pkgver=20101003
pkgrel=1
pkgdesc="A GUI for netcfg2, fork of netcfgGUI"
arch=('i686' 'x86_64' 'arm')
url="http://admiral0.github.com/netcfgfx/"
license=('GPL')
depends=('netcfg' 'wireless_tools' 'qt' 'sudo')
makedepends=('git' 'cmake')
install=netcfgfx.install
source=(netcfgfx.desktop netcfgfx.sudoers)
_gitroot="git://github.com/admiral0/netcfgfx"
_gitname="netcfgfx"
build() {
  msg "Connecting to GIT server..."
  if [[ -d $srcdir/${_gitname} ]]; then
     cd ${srcdir}/${_gitname} && git pull origin || return 1
  else
    git clone $_gitroot ${srcdir}/${_gitname} || return 1
    cd $srcdir/${_gitname}
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  mkdir build 
  cd build
  cmake ..
  make
  install -Dm755 netcfgfx ${pkgdir}/usr/bin/netcfgfx
  install -Dm644 ${srcdir}/${_gitname}/resources/Network_Connection_Manager.png ${pkgdir}/usr/share/pixmaps/netcfgfx.png
  install -Dm644 ${startdir}/netcfgfx.desktop ${pkgdir}/usr/share/applications/netcfgfx.desktop
  install -Dm0440 ${startdir}/netcfgfx.sudoers ${pkgdir}/etc/sudoers.d/netcfgfx
}
md5sums=('f16cf637a54233ab9637df8190526120'
         'e38cb5ccad77ad32ec68e9d28306bd87')

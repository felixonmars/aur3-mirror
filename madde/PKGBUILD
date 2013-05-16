# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=madde
pkgver=0.7.63
pkgrel=3
_rpmver=1.7
pkgdesc="MeeGo Application Development and Debuggin Environment"
arch=('i686' 'x86_64')
url="http://meego.gitorious.org/meego-developer-tools/madde"
license=('GPL2')
depends=('utfs')
makedepends=('sharutils' 'python-docutils')
options=('!strip')
source=("http://download.meego.com/live/Tools:/SDK:/Host/Trunk/src/${pkgname}-${pkgver}-${_rpmver}.src.rpm")
md5sums=('3f3643b6033d016d74f50118ce3d61a8')

build() {
  cd "$srcdir"
  tar -zxf ${pkgname}-${pkgver}.tar.gz

  rm -rf ${pkgname}-${pkgver}-build
  cp -R ${pkgname}-${pkgver} ${pkgname}-${pkgver}-build
  cd ${pkgname}-${pkgver}-build
  tar -zxf "${srcdir}"/debian.tar.gz
  cd debian/distfiles
  sh uubinaries.sh decode
  cd ../..

  export MADDE_DISTFILES="${srcdir}"/${pkgname}-${pkgver}-build/debian/distfiles
  
  target=linux
  [ "$CARCH" = "x86_64" ] && target=linux64

  MD5_FAILURE_EV=0 make $target
}

package() {
  cd "$srcdir"/${pkgname}-${pkgver}-build

  install -d "${pkgdir}"/usr/share/madde
  cp -rfp _build/docs "${pkgdir}"/usr/share/madde/

  install -d "${pkgdir}"/usr/lib/madde/linux-${CARCH}/{sysroots,toolchains}
  tar zxf _build/work-linux-${CARCH}/madde.tar.gz -C \
    "${pkgdir}"/usr/lib/madde/linux-${CARCH}

  cd "${pkgdir}"/usr/lib/madde/linux-${CARCH}
  sh postinstall/postinstall.sh /usr/lib/madde/linux-${CARCH} \
    /usr/lib/madde/linux-${CARCH}

  mv legal "${pkgdir}"/usr/share/madde/
  ln -sf ../../../share/madde/legal

  install -d "${pkgdir}"/usr/share/madde/templates
  mv templates/pscreate "${pkgdir}"/usr/share/madde/templates/
  ln -sf ../../../../share/madde/templates/pscreate templates/

  install -Dm755 bin/mad "${pkgdir}"/usr/bin/mad
  install -Dm755 bin/mad-admin "${pkgdir}"/usr/sbin/mad-admin
  rm -f bin/{mad,mad-admin}
  ln -sf ../../../../bin/mad bin/
  ln -sf ../../../../sbin/mad-admin bin/

  chmod 755 "${pkgdir}"/usr/lib/madde/linux-${CARCH}/madlib/madlib.sh
  chmod 755 "${pkgdir}"/usr/lib/madde/linux-${CARCH}/postinstall.done/postinstall-lib.sh

  # Cleanup
  rm "${pkgdir}"/usr/lib/madde/linux-${CARCH}/cache/madde.conf.d/{diablo,dummy,fremantle{,-prev},gregale}.conf
  rm "${pkgdir}"/usr/lib/madde/linux-${CARCH}/madlib/armel/{remote-wrapper.sh,utfs-client}
  rm "${pkgdir}"/usr/lib/madde/linux-${CARCH}/madlib/utfs-server
  rm "${pkgdir}"/usr/share/madde/docs/.exists
}

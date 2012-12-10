pkgname=kdebase4-workspace-git
pkgver=20121210
pkgrel=1
pkgdesc="KDE4 Base Workspace Programs"
arch=('i686' 'x86_64')
url="http://www.kde.org"
license=('GPL' 'LGPL' 'FDL')
depends=('kdepim4-runtime-git' 'lm_sensors' 'libraw1394' 'libqalculate'
         'qimageblitz' 'polkit-kde' 'xorg-xprop' 'libxdamage'
         'libxklavier' 'xorg-xsetroot' 'libxcomposite' 'libxinerama'
         'xorg-xrdb' 'libgles' 'libegl' 'libxres' 'xorg-xrandr'
         'xorg-xmessage' 'libusb-compat' 'xcb-util-image'
	 'xcb-util-renderutil')
makedepends=('git' 'cmake' 'automoc4' 'boost' 'kdebindings-python2' 'networkmanager' 'mesa')
source=('kdm' 'kde.pam' 'kde-np.pam' 'kscreensaver.pam' 'kdm.service' 'kdm.logrotate'
        'etc-scripts.patch' 'terminate-server.patch' 'kdm-xinitrd.patch')
md5sums=('363a36b63f84bac79959cfbefdb8309e'
         '6589fb28bd20d5ec1b4a7b9db9fc4209'
         '5a035421a9bfaa353caf04250c2b285c'
         '367a3538f54db71f108b34cfa31088ac'
         'c4b5f1b342b3dad38642318ca077daee'
         '08455692088f82811ea093c80a91840b'
         '8e526f7b4e7f8f02bc7c0c0214314109'
         '814350c52c135d6f7bdada1e29223d38'
         '43790b855557d9bb7b53b02e77a14f11')
install="kdebase4-workspace-git.install"
provides=('kdebase-workspace')
conflicts=('kdebase-workspace')
groups=('kde-git')

_gitroot="git://anongit.kde.org/kde-workspace"
_gitname="kde-workspace"

build() {
  cd $srcdir
  msg "Connecting to the GIT server...."
  
  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot --depth=1
  fi
  
  msg "GIT checkout done"
  msg "Starting make..."
  if [[ -d ${srcdir}/build ]]; then
    msg "Cleaning the previous build directory..."
    rm -rf ${srcdir}/build
  fi
  cp -r  $srcdir/$_gitname $srcdir/build
  cd $srcdir/build

  patch -p0 -i "${srcdir}"/etc-scripts.patch
  patch -p1 -i "${srcdir}"/kdm-xinitrd.patch
  patch -p0 -i "${srcdir}"/terminate-server.patch
  
  cmake . -DCMAKE_BUILD_TYPE=debugfull \
	-DCMAKE_SKIP_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_Xmms=OFF \
        -DWITH_Googlegadgets=OFF \
        -DWITH_libgps=OFF \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DWITH_CkConnector=OFF
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
  install -D -m644 "${srcdir}"/kde.pam "${pkgdir}"/etc/pam.d/kde
  install -D -m644 "${srcdir}"/kde-np.pam "${pkgdir}"/etc/pam.d/kde-np
  install -D -m644 "${srcdir}"/kscreensaver.pam "${pkgdir}"/etc/pam.d/kscreensaver
  install -d -m755 "${pkgdir}"/usr/share/xsessions/
  ln -sf /usr/share/apps/kdm/sessions/kde-plasma{,-safe}.desktop "${pkgdir}"/usr/share/xsessions/
  install -d -m755 "${pkgdir}"/etc/kde/{env,shutdown}
  install -d -g 135 -o 135 "${pkgdir}"/var/lib/kdm
  install -D -m755 "${srcdir}"/kdm "${pkgdir}"/etc/rc.d/kdm
  install -D -m644 "${srcdir}"/kdm.service "${pkgdir}"/usr/lib/systemd/system/kdm.service
  install -Dm644 "${srcdir}"/kdm.logrotate "${pkgdir}"/etc/logrotate.d/kdm
}

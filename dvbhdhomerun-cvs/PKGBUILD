# Maintainer: Antti Hautaniemi <an7oine at me com>

pkgname=dvbhdhomerun-cvs
true && pkgname=('dvbhdhomerun-kernel-cvs' 'dvbhdhomerun-user-cvs')
pkgbase=dvbhdhomerun-cvs
pkgver=20130306
pkgrel=2
pkgdesc="A linux DVB driver for the HDHomeRun (http://www.silicondust.com)"
arch=('i686' 'x86_64' 'arm')
url="http://sourceforge.net/apps/trac/dvbhdhomerun/wiki"
license=('GPL')
source=('compile-fix-201302.patch' 'userhdhomerun.rc.d' 'userhdhomerun.service')
md5sums=('a83ffbc59b50ebfb13575b6909f26dd0' '8db3071fb3c4b7603a6b1fe2b9248388' '84388e51257ad98505453e5782c5bf35')

makedepends=('cvs' 'libhdhomerun' 'cmake' 'linux-headers')

_cvsroot="pserver:anonymous:@dvbhdhomerun.cvs.sourceforge.net:/cvsroot"
_cvsmod=dvbhdhomerun

build() {
  cd "${srcdir}"
  cvs -z3 -d:${_cvsroot}/${_cvsmod} co -P ${_cvsmod}

  rm -rf ${_cvsmod}-build
  cp -a ${_cvsmod} ${_cvsmod}-build  

  cd "${srcdir}/${_cvsmod}-build"
  patch -p1 -i "${srcdir}/compile-fix-201302.patch"

  cd "${srcdir}/${_cvsmod}-build/kernel"
  make

  cd "${srcdir}/${_cvsmod}-build/userhdhomerun"
  make
}

package_dvbhdhomerun-kernel-cvs() {
 install=dvbhdhomerun-kernel-cvs.install

  cd "${srcdir}/${_cvsmod}-build/kernel"
  make INSTALL_MOD_PATH="${pkgdir}" install

  mkdir -p "${pkgdir}/usr/lib/udev/rules.d"
  mkdir -p "${pkgdir}/etc/modules-load.d"
  install "${srcdir}/${_cvsmod}-build/debian/dvbhdhomerun-utils.udev" \
"${pkgdir}/usr/lib/udev/rules.d/dvbhdhomerun-utils.rules"
  echo "dvb_hdhomerun" > "${pkgdir}/etc/modules-load.d/dvbhdhomerun.conf"

  _device_id="$( hdhomerun_config discover |cut -d ' ' -s -f 3 )"
  if [ "${_device_id}" = "" ]
	then _device_id=FFFFFFFF
  fi
  cat > "${pkgdir}/etc/dvbhdhomerun" <<EOF
[${_device_id}-0]
tuner_type=DVB-T

[${_device_id}-1]
tuner_type=DVB-T
EOF
}

package_dvbhdhomerun-user-cvs() {
  depends=('libhdhomerun' 'gcc-libs' 'bash')

  cd "${srcdir}/${_cvsmod}-build/userhdhomerun"
  PREFIX=/usr make DESTDIR="${pkgdir}" install

  mkdir -p "${pkgdir}/etc/rc.d"
  install -m0755 "${srcdir}/userhdhomerun.rc.d" "${pkgdir}/etc/rc.d/userhdhomerun"

  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  install -m0644 "${srcdir}/userhdhomerun.service" "${pkgdir}/usr/lib/systemd/system/userhdhomerun.service"
}

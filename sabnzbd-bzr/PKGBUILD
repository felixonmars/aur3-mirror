# Maintainer: dryes <joswiseman@gmail>
pkgname='sabnzbd-bzr'
pkgver=2886
pkgrel=1
pkgdesc='A web-interface based binary newsgrabber with NZB file support.'
arch=('any')
url='http://www.sabnzbd.org/'
license=('GPL')
depends=('par2cmdline' 'python2' 'python-cheetah' 'python2-feedparser' 'python-yenc' 'python2-pyopenssl' 'unrar' 'unzip' 'sqlite3' 'curl')
makedepends=('bzr')
backup=('etc/conf.d/sabnzbd')
install=('sabnzbd.install')
conflicts=('sabnzbd')
provides=('sabnzbd')
source=('sabnzbd.sh' 'sabnzbd.init' 'sabnzbd.confd')
md5sums=('0e90eab9ea5d80de91e2af41e84eb4cc' '7bd776f2c369026bb47e3d95982a0501' 'bc1723a2dd17d792785e1f6009b35751')

_bzrtrunk="https://code.launchpad.net/sabnzbd"
_bzrmod="sabnzbd"

build() {
  cd "${srcdir}"
  msg "Connecting to Bazaar server...."

  if [ -d ${_bzrmod} ] ; then
    cd ${_bzrmod} && bzr --no-plugins pull ${_bzrtrunk} -r ${pkgver}
    msg "The local files are updated."
  else
    bzr --no-plugins branch ${_bzrtrunk} ${_bzrmod} -r ${pkgver}
  fi

  msg "Bazaar checkout done or server timeout"
}

package() {
  mkdir -p "${pkgdir}/opt/sabnzbd"
  cp -r "${srcdir}/sabnzbd" "${pkgdir}/opt"

  cd "${pkgdir}/opt/sabnzbd"
  rm -rf .bzr* NSIS_Installer.nsi osx PKG-INFO sabnzbd-template.sparseimage.zip Sample-PostProc.cmd setup-osx.py setup.py *.txt win
  chmod +x Sample-PostProc.sh SABnzbd.py

  install -D -m755 "${srcdir}/sabnzbd.sh" "${pkgdir}/usr/bin/sabnzbd"
  install -D -m755 "${srcdir}/sabnzbd.init" "${pkgdir}/etc/rc.d/sabnzbd"
  install -D -m644 "${srcdir}/sabnzbd.confd" "${pkgdir}/etc/conf.d/sabnzbd"
}



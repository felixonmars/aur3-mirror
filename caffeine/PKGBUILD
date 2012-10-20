# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: LookTJ/Taylor Lookabaugh <jesus {dot} christ {dot} i {dot} love {at} gmail {dot} com>
# Contributor: alessandro_ufms

pkgname=caffeine
pkgver=464
pkgrel=2
pkgdesc="A system applet that allows you to inhibit the screensaver and the sleep power saving mode in an easy way"
arch=('any')
url="https://launchpad.net/caffeine"
license=('GPL')
depends=('python2-dbus' 'gtk2' 'python2-gobject' 'python2-notify' 'python-xlib' 'python2' 'dconf' 'pyxdg' 'kaa-metadata' 'hicolor-icon-theme')
makedepends=('bzr')
options=('!libtool' '!emptydirs')
install=caffeine.install
source=('https://launchpadlibrarian.net/85513438/patch.diff')
sha512sums=('7da99040796528f8654518d498e9749a826469aad7d14734f4de2a395032677fa0fdc590371e883edf96294cf8fe062533daddfcb13abfa0d89d6e43f05ee795')

_bzrtrunk="lp:caffeine"
_bzrmod="caffeine"

build()
{
  cd "${srcdir}"
  msg "Connecting to Bazaar server...."

  if [[ -d "${_bzrmod}" ]]; then
    cd "${_bzrmod}" && bzr pull "${_bzrtrunk}" -r "${pkgver}"
    msg "The local files are updated."
  else
    bzr branch "${_bzrtrunk}" "${_bzrmod}" -q -r "${pkgver}"
  fi  
  msg "Bazaar checkout done or server timeout"

  # export without .bzr directory
  cd "${srcdir}"
  rm -rf "${_bzrmod}-build"
  bzr export "${_bzrmod}-build" -q -d "${_bzrmod}"
 
  cd "${srcdir}/${_bzrmod}-build"

  # Thanks to André Ericson for the patch!
  # https://bugs.launchpad.net/caffeine/+bug/892663
  patch -Np0 -i "${srcdir}/patch.diff"

  # use python2 for version 2, instead of python (version 3)
  for i in utils core procmanager main applicationinstance __init__ flash_detect; do
    sed 's/python/python2/' -i caffeine/${i}.py
  done
}

package() {
  cd "${srcdir}/${_bzrmod}-build"
  python2 setup.py install --root="${pkgdir}"
}


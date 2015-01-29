# Maintainer: Guillaume ALAUX <guillaume at alaux dot net>
# Contributor: K. Hampf <khampf@users.sourceforge.net>
# Contributor: Kevin Sullivan <ksullivan@archlinux.us>

# Package available at https://aur.archlinux.org/packages/prey-bash-client/

pkgname=prey-bash-client
pkgver=0.6.4
pkgrel=2
pkgdesc='Remote tracking and monitoring application for laptops, smartphones, and other electronic devices'
arch=('any')
url='http://preyproject.com/'
license=('GPL3')
install=${pkgname}.install

# DEPENDENCY NOTE: the project says curl *or* wget can be used.
#   Also, it says scrot *or* imagemagick can be used. You may adjust the
#   dependencies as needed with this information.
depends=('curl' 'imagemagick' 'perl-io-socket-ssl' 'perl-net-ssleay' 'python2'
         'wireless_tools' 'lsb-release' 'unzip')
optdepends=('pygtk: for gui configuration'
            'xawtv: webcam features (includes streamer)'
            'mpg123: needed for audible alarm'
            'laptop-detect: checks whether you have a laptop'

            # NOTE: if you want to exclusively use one of the below, feel free to delete the original dependency above
            'wget: alternative to curl'
            'scrot: alternative to imagemagick')
conflicts=('prey-tracker')
replaces=('prey-tracker')

source=(https://github.com/prey/${pkgname}/archive/v${pkgver}.tar.gz
        1.56-overzealous-version-check.patch
        ${pkgname}.timer
        ${pkgname}.service)
sha256sums=('20dcaa2b0b0af6304c17317a4b57c95ca722a7534b3f83881cbdd01491da65d2'
            '9614243b70f943ea732c33fc898266f297be199088eaf760ecf2b9951038d464'
            '5c61fe09d16d343e7641949efacc0185a02a18cd625d13b0527cf051e0947274'
            '23cda9c0bd23c626922b9c1921383c14d6690a18cc912716f459b1a9c2b2eb83')
_install_dir=/usr/share/prey
backup=("${_install_dir:1}/config")

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < "${srcdir}/1.56-overzealous-version-check.patch"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  mkdir -p "${pkgdir}${_install_dir}"
  cp -r "${srcdir}"/${pkgname}-${pkgver}/* "${pkgdir}${_install_dir}"

  # symlink the config
  install -d "${pkgdir}/etc"
  ln -s "${_install_dir}/config" "${pkgdir}/etc/${pkgname}.conf"

  # systemd stuff
  install -d "${pkgdir}/usr/lib/systemd/system"
  install -m644 "${srcdir}/${pkgname}.timer" \
                "${srcdir}/${pkgname}.service" \
                "${pkgdir}/usr/lib/systemd/system"
}
sha256sums=('20dcaa2b0b0af6304c17317a4b57c95ca722a7534b3f83881cbdd01491da65d2'
            '9614243b70f943ea732c33fc898266f297be199088eaf760ecf2b9951038d464'
            '5c61fe09d16d343e7641949efacc0185a02a18cd625d13b0527cf051e0947274'
            '8a9a01b8231abc74060f6cc11b1dd9f1b0d7af5f6a17b9dfb1fa46afce366e95')

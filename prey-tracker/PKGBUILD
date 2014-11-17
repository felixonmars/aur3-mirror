# Maintainer: Guillaume ALAUX <guillaume at alaux dot net>
# Contributor: K. Hampf <khampf@users.sourceforge.net>
# Contributor: Kevin Sullivan <ksullivan@archlinux.us>

pkgname=prey-tracker
pkgver=0.6.4
pkgrel=2
pkgdesc='Remote tracking and monitoring application for laptops, smartphones, and other electronic devices'
arch=('any')
url='http://preyproject.com/'
license=('GPL3')
install=prey-tracker.install

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

source=(https://github.com/prey/prey-bash-client/archive/v${pkgver}.tar.gz
        1.56-overzealous-version-check.patch
        prey-tracker.timer
        prey-tracker.service)
sha256sums=('20dcaa2b0b0af6304c17317a4b57c95ca722a7534b3f83881cbdd01491da65d2'
            '9614243b70f943ea732c33fc898266f297be199088eaf760ecf2b9951038d464'
            'fc8b30f4efa8bd62bf168aed3122ebaeb027b71fbbcf3f5821308e0824d62722'
            '3319e419a207968ad9e520b48924b197fbf0da38daec17f0d6807a8f955bba03')
backup=('usr/share/prey/config')

prepare() {
  cd "${srcdir}/prey-bash-client-${pkgver}"
  patch -p1 < "${srcdir}/1.56-overzealous-version-check.patch"
}

package() {
  cd "${srcdir}/prey-bash-client-${pkgver}"

  # make directories and move files to /usr/share/prey/
  mkdir -p "${pkgdir}/usr/share/prey/"
  cp -r "${srcdir}"/prey-bash-client-${pkgver}/* "${pkgdir}/usr/share/prey/"

  # symlink the config
  install -d "${pkgdir}/etc"
  ln -s "/usr/share/prey/config" "${pkgdir}/etc/prey-tracker.conf"

  # systemd stuff
  install -d "${pkgdir}/usr/lib/systemd/system"
  install -m644 "${srcdir}/prey-tracker.timer" \
                "${srcdir}/prey-tracker.service" \
                "${pkgdir}/usr/lib/systemd/system"
}

# vim:set ts=2 sw=2 et:

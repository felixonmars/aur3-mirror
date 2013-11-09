# Maintainer: Thomas Sowell <tom@fancydriving.org>

buildarch=1

pkgname=chromiumos-metrics
pkgdesc="Chromium OS Metrics Package"
pkgver=R30.4537
pkgrel=1
arch=('any')
groups=('chromarchy')
url="http://git.chromium.org/gitweb/?p=chromiumos/platform/metrics.git;a=summary"
license=('custom:chromiumos')
_gitname='metrics'
depends=('dbus' 'glib2' 'dbus-glib' 'chromiumos-libbase' 'libchromeos' 'chromiumos-librootdev' 'google-gflags')
makedepends=('git' 'chromiumos-system-api')

source=(metrics-dbus.patch
        "$_gitname::git+http://git.chromium.org/git/chromiumos/platform/metrics.git#branch=release-R30-4537.B")

md5sums=('5b781d21c43092d4adf27f111fbe1477'
         'SKIP')

prepare() {
  cd "$srcdir/$_gitname"
  # Fix dbus header paths
  git apply ${srcdir}/metrics-dbus.patch
}

build() {
  cd "$srcdir/$_gitname"

  CXXFLAGS="-Wno-error=deprecated-declarations -O" make
}

package() {
  cd "$srcdir/$_gitname"

  install -d ${pkgdir}/usr/bin
  install -m 755 metrics_client ${pkgdir}/usr/bin
  install -m 755 metrics_daemon ${pkgdir}/usr/bin
  install -m 755 syslog_parser.sh ${pkgdir}/usr/bin

  install -d ${pkgdir}/usr/lib
  install -m 644 libmetrics.so ${pkgdir}/usr/lib

  install -d ${pkgdir}/usr/include/metrics
  install -m 644 c_metrics_library.h ${pkgdir}/usr/include/metrics
  install -m 644 metrics_library.h ${pkgdir}/usr/include/metrics
  install -m 644 metrics_library_mock.h ${pkgdir}/usr/include/metrics
  install -m 644 timer.h ${pkgdir}/usr/include/metrics
  install -m 644 timer_mock.h ${pkgdir}/usr/include/metrics

  install -d ${pkgdir}/var/log/metrics

  install -m 644 -D LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}


# Maintainer: Nuno Araujo <nuno.araujo@russo79.com>
pkgname=gnome15-plugins
true && pkgname=('gnome15-plugin-background'
                 'gnome15-plugin-cairo-clock'
                 'gnome15-plugin-clock'
                 'gnome15-plugin-fx'
                 'gnome15-plugin-g15daemon-server'
                 'gnome15-plugin-im'
                 'gnome15-plugin-macro-recorder'
                 'gnome15-plugin-macros'
                 'gnome15-plugin-profiles'
                 'gnome15-plugin-menu'
                 'gnome15-plugin-mounts'
                 'gnome15-plugin-mpris'
                 'gnome15-plugin-notify-lcd'
                 'gnome15-plugin-panel'
                 'gnome15-plugin-screensaver'
                 'gnome15-plugin-stopwatch'
                 'gnome15-plugin-mediaplayer'
                 'gnome15-plugin-weather'
                 'gnome15-plugin-weather-noaa'
                 'gnome15-plugin-weather-yahoo'
                 'gnome15-plugin-volume'
                 'gnome15-plugin-rss'
                 'gnome15-plugin-sysmon'
                 'gnome15-plugin-processes'
                 'gnome15-plugin-debug'
                 'gnome15-plugin-cal'
                 'gnome15-plugin-cal-evolution'
                 'gnome15-plugin-cal-google'
                 'gnome15-plugin-google-analytics'
                 'gnome15-plugin-lcdbiff'
                 'gnome15-plugin-sense'
                 'gnome15-plugin-lcdshot'
                 'gnome15-plugin-tweak'
                 'gnome15-plugin-tails'
                 'gnome15-plugin-display'
                 'gnome15-plugin-voip'
                 'gnome15-plugin-voip-teamspeak3'
                 'gnome15-plugin-trafficstats')

pkgbase=gnome15-plugins
pkgver=0.9.5
pkgrel=1
pkgdesc="gnome15 plugins"
arch=('any')
url="http://www.russo79.com/gnome15"
license=('GPL')
depends=('python2' 'gnome15' 'python2-xlib')
conflicts=('gnome15-gnome-plugins')
source=("https://projects.russo79.com/attachments/download/130/${pkgbase}-${pkgver}.tar.gz")
md5sums=('85e93e4f873636698f987a14669ac063')

prepare() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  # python2 fix
  for file in $(find . -type f -name '*' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done
}

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  ./configure --prefix=/usr \
  --enable-background --enable-cairo-clock --enable-clock --enable-fx \
  --enable-g15daemon-server --enable-im --enable-macro-recorder --enable-macros \
  --enable-profiles --enable-menu --enable-mounts --enable-mpris --enable-notify-lcd \
  --enable-panel --enable-screensaver --enable-stopwatch --enable-mediaplayer \
  --enable-weather --enable-weather-noaa --enable-weather-yahoo \
  --disable-indicator-me --disable-indicator-messages \
  --enable-volume --enable-rss --enable-sysmon --enable-processes --enable-debug \
  --enable-cal --enable-cal-evolution --enable-cal-google --enable-google-analytics \
  --enable-lcdbiff --enable-sense --enable-lcdshot --enable-tweak \
  --enable-tails --enable-display --enable-voip --enable-voip-teamspeak3 \
  --enable-trafficstats \
  PYTHON=python2 PYTHON_VERSION=2
  make
}

package_gnome15-plugin-background() {
  true && pkgdesc="gnome15 Wallpaper plugin"
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-cairo-clock() {
  true && pkgdesc="gnome15 Cairo Clock plugin"
  true && depends=('gnome15')
  true && optdepends=('cairo-clock: Add more skins')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-clock() {
  true && pkgdesc="gnome15 Clock plugin"
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-fx() {
  true && pkgdesc="gnome15 Special Effect plugin"
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-g15daemon-server() {
  true && pkgdesc="gnome15 G15Daemon Compatibility plugin"
  true && provides=('g15daemon')
  true && conflicts=('g15daemon')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-im() {
  true && pkgdesc="gnome15 Instant Messenger plugin"
  true && depends=('gnome15' 'python2-telepathy')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-macro-recorder() {
  true && pkgdesc="gnome15 Macro Recorder plugin"
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-macros() {
  true && pkgdesc="gnome15 Macro Information plugin"
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-profiles() {
  true && pkgdesc="gnome15 Profile Selector plugin"
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-menu() {
  true && pkgdesc="gnome15 Menu plugin"
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-mounts() {
  true && pkgdesc="gnome15 Mounts plugin"
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-mpris() {
  true && pkgdesc="gnome15 Now Playing plugin"
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-notify-lcd() {
  true && pkgdesc="gnome15 Notify plugin"
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-panel() {
  true && pkgdesc="gnome15 Panel plugin"
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-screensaver() {
  true && pkgdesc="gnome15 Screensaver plugin"
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-stopwatch() {
  true && pkgdesc="gnome15 Stopwatch plugin"
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-mediaplayer() {
  true && pkgdesc="gnome15 Media Player plugin"
  true && depends=('gnome15' 'gstreamer0.10-python')
  groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-weather() {
  true && pkgdesc="gnome15 Weather plugin"
  true && optdepends=("gnome15-plugin-weather-noaa:  Use NOAA as weather source"
                      "gnome15-plugin-weather-yahoo: Use Yahoo as weather source")
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-weather-noaa() {
  true && pkgdesc="gnome15 Weather (NOAA support) plugin"
  true && depends=('gnome15' 'gnome15-plugin-weather')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-weather-yahoo() {
  true && pkgdesc="gnome15 Weather (Yahoo support) plugin"
  true && depends=('gnome15' 'gnome15-plugin-weather')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

#package_gnome15-plugin-indicator-messages() {
#  true && pkgdesc="gnome15 Cairo Clock plugin"
#  true && depends=('gnome15' 'cairo-clock')
#  true && groups=('gnome15-plugins')
#
#  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"
#
#  make DESTDIR="${pkgdir}/" install
#}

package_gnome15-plugin-volume() {
  true && pkgdesc="gnome15 Volume Monitor plugin"
  true && depends=('gnome15' 'python-pyalsaaudio')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-rss() {
  true && pkgdesc="gnome15 RSS plugin"
  true && depends=('gnome15' 'python2-feedparser')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-sysmon() {
  true && pkgdesc="gnome15 System Monitor plugin"
  true && depends=('gnome15' 'python2-cairoplot-gnome15' 'python2-gtop')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-processes() {
  true && pkgdesc="gnome15 Process List plugin"
  true && depends=('gnome15' 'python2-gtop')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-debug() {
  true && pkgdesc="gnome15 Debug plugin"
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-cal() {
  true && pkgdesc="gnome15 Calendar plugin"
  true && optdepends=('gnome15-plugin-cal-evolution: Use evolution data'
                      'gnome15-plugin-cal-google:    Use Google calendar data')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-cal-evolution() {
  true && pkgdesc="gnome15 Calendar (Evolution support) plugin"
  true && depends=('gnome15' 'gnome15-plugin-cal' 'python2-vobject')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-cal-google() {
  true && pkgdesc="gnome15 Calendar (Google support) plugin"
  true && depends=('gnome15' 'gnome15-plugin-cal' 'python2-gdata')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-google-analytics() {
  true && pkgdesc="gnome15 Google Analytics plugin"
  true && depends=('gnome15' 'python2-gdata' 'python2-cairoplot-gnome15')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-lcdbiff() {
  true && pkgdesc="gnome15 POP3 / IMAP Email Notification plugin"
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-sense() {
  true && pkgdesc="gnome15 Sensors plugin"
  true && depends=('gnome15' 'python2-cairoplot-gnome15' 'python2-sensors' 'libatasmart')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-lcdshot() {
  true && pkgdesc="gnome15 LCD Screenshot plugin"
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-tweak() {
  true && pkgdesc="gnome15 Tweak Gnome15 plugin"
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-tails() {
  true && pkgdesc="gnome15 Tails plugin"
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-display() {
  true && pkgdesc="gnome15 Display Resolution plugin"
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-voip() {
  true && pkgdesc="gnome15 VoIP plugin"
  true && optdepends=('gnome15-plugin-voip-teamspeak3: Add TeamSpeak3 support')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-voip-teamspeak3() {
  true && pkgdesc="gnome15 Teamspeak3 plugin"
  true && depends=('gnome15' 'gnome15-plugin-voip' 'teamspeak3')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

package_gnome15-plugin-trafficstats() {
  true && pkgdesc="gnome15 Traffic Stats plugin"
  true && depends=('gnome15')
  true && optdepends=('vnstat: use vnstat data')
  true && groups=('gnome15-plugins')

  cd "${srcdir}/${pkgbase}-${pkgver}/src/${pkgname:15}"

  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:

# Maintainer  : Firef0x <Firefgx {at) gmail [dot} com>
# Contributor : Firef0x <Firefgx {at) gmail [dot} com>
# Contributor : Kyro <chris-bos-lee@hotmail.com>

_pkgver=33.x

pkgname=firefox-private
pkgver=33.0
pkgrel=1
pkgdesc='Standalone web browser from mozilla.org, built with GCC -O3 SSE2, betterpgo, support for media-libs/gstreamer, and added an environment variable MOZILLA_DISABLE_PLUGINS to firefox.'
url='http://sourceforge.net/projects/libportable/files/Firefox'
arch=('x86_64')
license=('MPL' 'GPL' 'LGPL')
depends=('gtk2'
         'mozilla-common'
         'libxt'
         'startup-notification'
         'mime-types'
         'dbus-glib'
         'alsa-lib'
         'desktop-file-utils'
         'hicolor-icon-theme'
         'libvpx'
         'icu'
         'libevent'
         'nss'
         'hunspell'
         'sqlite')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'gst-plugins-good: h.264 video'
            'gst-libav: h.264 video')
provides=("firefox=${pkgver}" "firefox-i18n-zh-cn=${pkgver}")
conflicts=('firefox' 'firefox-private-zh-cn')
options=('!emptydirs')

# If you couldn't get the first source file, replace the first item in array 'source' with the following link
# 如果您不能下载source里的第一个文件，请用以下链接替换source数组的第一项(如果还是不行，请番,羽,土,啬)
# "http://jaist.dl.sourceforge.net/project/libportable/Firefox/${CARCH}/${_pkgver}/firefox-private-${pkgver}.zh-CN.linux-x86_64.tar.bz2"
source=("http://downloads.sourceforge.net/project/libportable/Firefox/${CARCH}/${_pkgver}/firefox-private-${pkgver}.zh-CN.linux-${CARCH}.tar.bz2"
        "vendor.js"
        "firefox.desktop"
        "16.png"
        "22.png"
        "24.png"
        "32.png"
        "48.png"
        "64.png"
        "128.png"
        "192.png"
        "256.png"
        "384.png")
md5sums=('91a0d28ecbefcda140c3708b7ed4597a'
         'c382e35315047e4ca368d09383b39b8d'
         '6174396b4788deffa399db3f6f010a94'
         'ccf618ebec94f98741cbf99ff5c89af6'
         '534778117755231290b5892165b2257b'
         'f11dcb54897188bb7cddc2a10bca048f'
         '93e3e41a6166540c3f5632c804b40c1b'
         '29e9295bf32d16560103327cbdacbe45'
         'e8dc544804a3e5033e9f5f18c9e7c2d4'
         '2c33a28d0fd6b94bffe717df9ca6a236'
         'bc3a02fbde6efb2c2bf8c28399345e23'
         '4b51c1ede396f37409b7b00bca1e366f'
         'b24fd5bc7acbf051c80cecf97b1929ba')

install=${pkgname}.install

changelog=README.md

# Set to 0 if you don't need the default searchplugins
# 如果您不需要默认的搜索引擎插件，请设置为0
_keep_searchplugins=1

package(){
  cd "${srcdir}"/firefox/

  install -d -m755 "${pkgdir}/usr/lib/firefox"
  mv * "${pkgdir}/usr/lib/firefox"

  # Install missing resource files
  install -d -m755 "${pkgdir}/usr/lib/firefox/browser/defaults/preferences"
  install -Dm644 "${srcdir}/vendor.js" "${pkgdir}/usr/lib/firefox/browser/defaults/preferences/vendor.js"

  install -d -m755 "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/firefox.desktop" "${pkgdir}/usr/share/applications/firefox.desktop"

  for i in 16 22 24 32 48 64 128 192 256 384; do
    install -d -m755 "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps"
    install -Dm644 "${srcdir}/$i.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/firefox.png"
  done

  # Use system-provided dictionaries
  ln -s /usr/share/hunspell "${pkgdir}/usr/lib/firefox/dictionaries"
  ln -s /usr/share/hyphen "${pkgdir}/usr/lib/firefox/hyphenation"

  # Remove default searchplugins if _keep_searchplugins=0
  if [ ${_keep_searchplugins} -eq 0 ]; then
    rm -f "${pkgdir}"/usr/lib/firefox/browser/searchplugins/*
  fi

  # Make symbolic links
  install -d -m755 "${pkgdir}/usr/bin"
  ln -sf /usr/lib/firefox/firefox "${pkgdir}"/usr/bin/firefox
  # Workaround for bug #658850
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -sf /usr/lib/firefox/firefox "${pkgdir}"/usr/lib/firefox/firefox-bin
}

# vim:set ts=2 sw=2 et:

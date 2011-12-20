# Maintainer: ilikenwf/Matt Parnell <parwok@gmail.com>
# Contributor: Muhammad 'MJ' Jassim <UnbreakableMJ@gmail.com>
# Contributor: Aaron 'venisonslurpee' Laursen <venisonslurpee@gmail.com>
# Contributor: Techlive Zheng <techlivezheng at gmail dot com>

# I hacked this to just scrape the needed versioning info so that this doesn't
# have to be edited every day.
# - ilikenwf

pkgname=songbird-nightly-bin
pkgver=2011.07.20
pkgrel=1
pkgdesc="Nightly Songbird build. Automatically grabs latest build. 32-bit support only."
arch=('i686')
url="http://www.songbirdnest.com/"
license=('GPL2')
depends=('libxrender' 'libxext' 'libidl2' 'libx11' 'libxmu' 'libxt'
         'sqlite3' 'gtk2' 'nss'
         'gstreamer0.10'
         'gstreamer0.10-base-plugins'
         'gstreamer0.10-good-plugins'
         )
optdepends=(
		'gstreamer0.10-ffmpeg: support for more formats'
        'gstreamer0.10-bad-plugins: support for more formats'
        'gstreamer0.10-ugly-plugins: support for more formats'
        )
provides=('songbird')
conflicts=('songbird' 'songbird-svn' 'songbird-bin')
install=songbird-nightly-bin.install
source=(Songbird.desktop songbird-launcher.sh)
md5sums=('ea56b6f13b3cb70a656360f78e993a98'
         '479af227dc412b382ac030e3f769324a')

build() {
  # Why update daily when we can just scrape the url for the latest version?  -ilikenwf
  VERSION=`wget -qO- "http://developer.songbirdnest.com/builds/trunk/latest/" \
      | grep -o 'href=\"Songbird_.*_linux-i686.tar.gz\"' | sed 's/href=\"//' | sed 's/gz\".*/gz/'`

  cd ${srcdir}

  if [ -a `echo ${VERSION} | grep -o Songbird.*.tar.gz` ];then
    msg "File exists, no need to download."
  else
    wget http://developer.songbirdnest.com/builds/trunk/latest/${VERSION}
    wget http://developer.songbirdnest.com/builds/trunk/latest/${VERSION}.md5
  fi

  msg "Checking md5sum of Songbird archive..."
  md5sum -c ${VERSION}.md5

  msg "Building."

  tar xf ${VERSION}

  # Use the proper number for the pkgver and pkgrel
  # Tricks to made AUR not pick up these shell command as pkgver and pkgrel
  : && pkgver=$(echo ${VERSION} | sed 's/Songbird\_//' | sed 's/\-.*_linux.*\.tar\.gz//')
  : && pkgrel=$(echo ${VERSION} | grep -o '[0-9][0-9][0-9][0-9]')

  cd Songbird_build-${pkgrel}

  install -d --group=users ${pkgdir}/opt/songbird
  cp -a ${srcdir}/Songbird_build-${pkgrel}/* ${pkgdir}/opt/songbird
  chmod 755 ${pkgdir}/opt/songbird/songbird
  chmod 755 ${pkgdir}/opt/songbird/songbird-bin
  chmod 755 ${pkgdir}/opt/songbird/xulrunner/xulrunner
  chmod 755 ${pkgdir}/opt/songbird/xulrunner/xulrunner-bin
  chmod -R a+r ${pkgdir}/opt/songbird
  install -D ${srcdir}/Songbird_build-${pkgrel}/chrome/icons/default/default.xpm \
         ${pkgdir}/usr/share/pixmaps/Songbird.xpm
  install -D -m644 ${srcdir}/Songbird.desktop \
         ${pkgdir}/usr/share/applications/Songbird.desktop
  install --directory ${pkgdir}/usr/bin

  ## fixing the problem with system-wide installs:
  find ${pkgdir}/opt/songbird -type d -exec chmod 755 {} \;
  install --directory ${pkgdir}/usr/bin
  install ${srcdir}/songbird-launcher.sh ${pkgdir}/usr/bin/songbird
}

# Maintainer: Alexey Zakharov <alexzkhr@gmail.com>
# Based on jdk: <https://aur.archlinux.org/packages/jdk/>, which in turn is based on jre: <https://aur.archlinux.org/packages.php?ID=51908>
pkgname='jdk8-rasp-pi'
_major='8'
_minor='6'
_build='b23'
_pkg="${_major}u${_minor}"
pkgver="${_major}.${_minor}"
pkgrel=1
pkgdesc="The Java Development Kit, designed to be installed on Raspberry PI"
url='http://www.oracle.com/technetwork/java/javase/downloads/jdk8-arm-downloads-2187472.html'
arch=('armv6h')
depends=('shared-mime-info' 'desktop-file-utils')
optdepends=('alsa-lib: sound support' 'ttf-dejavu: fonts' 'hicolor-icon-theme' 'libx11' 'libxrender' 'libxtst'  'xdg-utils')
license=('custom')
install='jdk.install'
replaces=("jdk8-rasp-pi")
conflicts=("jdk8-rasp-pi")

_arch=arm  # Workaround for the AUR Web interface Source parser
_arch2=arm

source=("http://download.oracle.com/otn-pub/java/jdk/${_pkg}-${_build}/jdk-${_pkg}-linux-arm-vfp-hflt.tar.gz"         
        'derby-network-server'
        'derby-network-server.conf'
        'java-monitoring-and-management-console.desktop'
        'java-policy-settings.desktop'
        'java-visualvm.desktop'
        'javaws-launcher'
        'jdk.csh'
        'jdk.sh'
        'jdk.install')

md5sums=('a5f2a7dce850d1c0582213291c89d653'
         'a279e195e249000646895d93e199860d'
         '4bdff6982c66d24a879c424aaac3d04d'
         'da10de5e6507c392fc9871076ef53ec6'
         'f4e25ef1ccef8d36ff2433c3987a64fe'
         '35fd89c5c170021d2183593335703703'
         '45c15a6b4767288f2f745598455ea2bf'
         '5ceb8dac4499dabd433e6272f0d59eae'
         '2810b5e52b0041b9762df8fc3caed749'
         '2489adaa2a18192a1c46665adfffa319')

[ "$CARCH" = 'x86_64' ] && md5sums[0]='adc3827532741873de9216a5aed883ed'  # 64bit-version.
[ "$CARCH" = 'armv6h' ] && md5sums[0]='a5f2a7dce850d1c0582213291c89d653'  # armv6h

### Need to set cookie, otherwise the oracle server won't provide the file.
DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -O -b "oraclelicense=a"')

PKGEXT=".pkg.tar"


package() {
  msg2 "Creating required dirs"
  
  installdir="/opt/java${_major}"
  destdir="${pkgdir}/${installdir}"
  
  cd "jdk1.${_major}.0_0${_minor}"
  
  mkdir -p "${destdir}"
  mkdir -p "${pkgdir}"/usr/share
  mkdir -p "${pkgdir}"/etc/{.java/.systemPrefs}  
  mkdir -p "${pkgdir}"/etc/profile.d
  mkdir -p "${pkgdir}"/etc/rc.d
  mkdir -p "${pkgdir}"/etc/conf.d
  mkdir -p "${pkgdir}"/usr/share/applications
  mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"

  msg2 "Removing the redundancies"
  rm -rf db/bin/*.bat jre/{plugin/,COPYRIGHT,LICENSE,*.txt} man/ja # lib/{desktop,visualvm/platform/docs}

  msg2 "Moving stuff in place"
  #mv jre/lib/desktop/* man "${pkgdir}"/usr/share/
  mv COPYRIGHT LICENSE *.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/
  mv * "${destdir}"

  #msg2 "Symlinking the plugin"
  #ln -s "${installdir}"/jre/lib/"${_arch2}"/libnpjp2.so "${destdir}"/usr/lib/mozilla/plugins/

  msg2 "Installing the scripts, confs and .desktops of our own"
  cd "${srcdir}"
  install -m755 jdk.{,c}sh "${pkgdir}"/etc/profile.d/
  install -Dm644 derby-network-server.conf "${pkgdir}"/etc/conf.d/derby-network-server
  install -m755 derby-network-server "${pkgdir}"/etc/rc.d/
  install -m755 javaws-launcher "${destdir}"/jre/bin/
  install -m644 *.desktop "${pkgdir}"/usr/share/applications/

  #msg2 "Tweaking the javaws .desktop file"
  #sed -e 's/Exec=javaws/&-launcher %f/' -e '/NoDisplay=true/d' -i "${destdir}"/usr/share/applications/sun-javaws.desktop
}


# PKGBUILD stolen from jdk7-compat
# Maintainer: ava1ar <mail(at)ava1ar(dot)info>
# Contributor: Damian Nowak <damian.nowak@atlashost.eu>
# Contributor: joschi <jochen+aur@schalanda.name>
# Contributor: dreieck
# Contributor: Det
# Based on jdk: <https://aur.archlinux.org/packages/jdk/>, which in turn is based on jre: <https://aur.archlinux.org/packages.php?ID=51908>

pkgname='jdk8-compat'
_major='8'
_minor='20'
_build='b26'
_pkg="${_major}u${_minor}"
pkgver="${_major}.${_minor}"
pkgrel=1
pkgdesc="The Java Development Kit, designed to be installed in parallel with another java installation."
url='http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html'
arch=('i686' 'x86_64')
license=('custom')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'libx11' 'libxrender' 'libxtst' 'shared-mime-info' 'xdg-utils')
optdepends=('alsa-lib: sound support'
            'ttf-dejavu: fonts')
license=('custom')
install='jdk.install'
replaces=("jre8-compat")
conflicts=("jre8-compat")

_arch=i586  # Workaround for the AUR Web interface Source parser
_arch2=i386; [ "$CARCH" = 'x86_64' ] && _arch=x64 && _arch2=amd64

source=("http://download.oracle.com/otn-pub/java/jdk/${_pkg}-${_build}/jdk-${_pkg}-linux-${_arch}.tar.gz"
        'derby-network-server'
        'derby-network-server.conf'
        'java-monitoring-and-management-console.desktop'
        'java-policy-settings.desktop'
        'java-visualvm.desktop'
        'javaws-launcher'
        'jdk.csh'
        'jdk.sh'
        'jdk.install')

sha1sums=('c08fe031b1cc79f4561084c8cd0ab96aef221ba3'
	'df337276050826c4e10bf4b04106bb4e4fcde9db'
	'dc603b8644559863ff16772e157328109da89f2e'
	'876f586f3a35725fb4692b3a35f57144284e2aac'
	'c5c89be8f2d97be5f73ce44c7c61aace7a96ddbf'
	'9083cdd804f6f0d006699a07af66a8a98461a31b'
	'82fddc4beac54baf7baaf47529fb4ca888692cc8'
	'0c7e13bccaef1b7544f20cd2d350527293a28243'
	'ece57f951205b3a57f7121ab4c6982b3817f3757'
	'd4b855de5114cd23007101221a8b2599c63c7ad7')

[ "$CARCH" = 'x86_64' ] && sha1sums[0]='36eaa3a5524ed6b97ae1296d50f18ba03d4b37f5'  # 64bit-version.

### Need to set cookie, otherwise the oracle server won't provide the file.
DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -O -b "oraclelicense=a"')

PKGEXT=".pkg.tar"


package() {
  msg2 "Creating required dirs"
  
  installdir="/opt/java${_major}"
  destdir="${pkgdir}/${installdir}"
  
  cd "jdk1.${_major}.0_${_minor}"
  
  mkdir -p "${destdir}"
  mkdir -p "${destdir}"/usr/share
  mkdir -p "${destdir}"/etc/{.java/.systemPrefs}
  mkdir -p "${destdir}"/usr/lib/mozilla/plugins
  mkdir -p "${destdir}"/etc/profile.d
  mkdir -p "${destdir}"/etc/rc.d
  mkdir -p "${destdir}"/etc/conf.d
  mkdir -p "${destdir}"/usr/share/applications
  mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"

  msg2 "Removing the redundancies"
  rm -r db/bin/*.bat jre/{plugin/,COPYRIGHT,LICENSE,*.txt} man/ja # lib/{desktop,visualvm/platform/docs}

  msg2 "Moving stuff in place"
  mv jre/lib/desktop/* man "${destdir}"/usr/share/
  mv COPYRIGHT LICENSE *.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/
  mv * "${destdir}"

  msg2 "Symlinking the plugin"
  ln -s "${installdir}"/jre/lib/"${_arch2}"/libnpjp2.so "${destdir}"/usr/lib/mozilla/plugins/

  msg2 "Installing the scripts, confs and .desktops of our own"
  cd "${srcdir}"
  install -m755 jdk.{,c}sh "${destdir}"/etc/profile.d/
  install -Dm644 derby-network-server.conf "${destdir}"/etc/conf.d/derby-network-server
  install -m755 derby-network-server "${destdir}"/etc/rc.d/
  install -m755 javaws-launcher "${destdir}"/jre/bin/
  install -m644 *.desktop "${destdir}"/usr/share/applications/

  msg2 "Tweaking the javaws .desktop file"
  sed -e 's/Exec=javaws/&-launcher %f/' -e '/NoDisplay=true/d' -i "${destdir}"/usr/share/applications/sun-javaws.desktop
}

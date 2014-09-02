# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: Guillaume ALAUX <guillaume at alaux dot net>
# Contributor: Det
pkgname=('jre7-oracle' 'jdk7-oracle')
#pkgname=('jre7-oracle-headless' 'jre7-oracle' 'jdk7-oracle')
pkgbase=java7-oracle
_java_ver=7
_update=67
_build=01
# FIXME pkgver to match Arch Linux JDK versioning scheme. Watch out for source
pkgver=${_java_ver}.u${_update}
pkgrel=2

arch=('i686' 'x86_64')
if [ "${CARCH}" = 'x86_64' ]; then
  _JARCH=x64
  _JARCH_ALT=amd64
  _sha256sum_jdk='54dd1e13edf18c64941a55da9c91210b53dc5cf48f1a8f4538c863049e346335'
else
  _JARCH=i586
  _JARCH_ALT=i386
  _sha256sum_jdk='b6231064ad2c9fbbcb099dba17b1dcf12033e922b9c24e4348b9a01e9ebaa85c'
fi

url='http://www.oracle.com/technetwork/java/index.html'
license=('custom')
source=(http://download.oracle.com/otn-pub/java/jdk/${_java_ver}u${_update}-b${_build}/jdk-${_java_ver}u${_update}-linux-${_JARCH}.tar.gz
        jconsole-${_java_ver}-oracle.desktop
        policytool-${_java_ver}-oracle.desktop)

sha256sums=(${_sha256sum_jdk}
            '822863cab818dc0d5106975f2ad3209e8cbb6f93bd45920ea0488a0fc1c271c6'
            '13a0eab88c2ecdbfc705e972df865c318d1684bdd80c96b460f881dfc52d6316')

makedepends=('curl')
DLAGENTS=('http::/usr/bin/curl -LC - -b "oraclelicense=a" -O')

_jdkname=${_java_ver}-oracle
_jvmdir=/usr/lib/jvm/java-${_java_ver}-oracle
_imgdir="jdk1.${_java_ver}.0_$(printf '%.2d' ${_update})"

package_jre7-oracle() {
  pkgdesc="Oracle Java ${_java_ver} runtime environment"
  # FIXME jre dependencies
  depends=('java-common' 'desktop-file-utils' 'hicolor-icon-theme' 'libxrender' 'libxtst' 'shared-mime-info' 'xdg-utils')
  optdepends=('alsa-lib: sound' 'ttf-dejavu: fonts')
  provides=("java-runtime-headless=${_java_ver}" "java-runtime=${_java_ver}" "java-runtime-headless-oracle=${_java_ver}" "java-runtime-oracle=${_java_ver}")
  _backup_etc=(etc/java-${_java_ver}-oracle/${_JARCH_ALT}/jvm.cfg
               etc/java-${_java_ver}-oracle/${_JARCH_ALT}/server/Xusage.txt
               etc/java-${_java_ver}-oracle/calendars.properties
               etc/java-${_java_ver}-oracle/content-types.properties
               etc/java-${_java_ver}-oracle/flavormap.properties
               etc/java-${_java_ver}-oracle/fontconfig.properties.src
               etc/java-${_java_ver}-oracle/images/cursors/cursors.properties
               etc/java-${_java_ver}-oracle/javafx.properties
               etc/java-${_java_ver}-oracle/jvm.hprof.txt
               etc/java-${_java_ver}-oracle/logging.properties
               etc/java-${_java_ver}-oracle/management/jmxremote.access
               etc/java-${_java_ver}-oracle/management/jmxremote.password.template
               etc/java-${_java_ver}-oracle/management/management.properties
               etc/java-${_java_ver}-oracle/management/snmp.acl.template
               etc/java-${_java_ver}-oracle/net.properties
               etc/java-${_java_ver}-oracle/psfontj2d.properties
               etc/java-${_java_ver}-oracle/psfont.properties.ja
               etc/java-${_java_ver}-oracle/security/java.policy
               etc/java-${_java_ver}-oracle/security/java.security
               etc/java-${_java_ver}-oracle/security/javaws.policy
               etc/java-${_java_ver}-oracle/sound.properties)
  backup=(${_backup_etc[@]})
  install=install_jre${_java_ver}-oracle.sh

  # FIXME try to use vars for this version number
  cd "${srcdir}/${_imgdir}/jre"

  install -d -m 755 "${pkgdir}${_jvmdir}/jre/"
  cp -ra * "${pkgdir}${_jvmdir}/jre"

  install -d -m 755 ${pkgdir}/usr/share
  # FIXME sed desktop files so that they directly call /usr/lib/jvm/java-7-oracle/jre/bin/*
  mv ${pkgdir}${_jvmdir}/jre/lib/desktop/* ${pkgdir}/usr/share
  rmdir ${pkgdir}${_jvmdir}/jre/lib/desktop
  # Extra desktop entries
  install ${srcdir}/{jconsole,policytool}-${_java_ver}-oracle.desktop ${pkgdir}/usr/share/applications/

  # Set config files
  rm "${pkgdir}${_jvmdir}"/jre/lib/fontconfig.*.properties.src

  # TODO Remove 'non-headless' lib files
  #for f in ${_nonheadless[@]}; do
  #  rm "${pkgdir}${_jvmdir}/jre/${f}"
  #done

  # Man pages
  pushd bin
  install -d -m 755 "${pkgdir}"/usr/share/man/{,ja/}man1/
  for m in *; do
    # '|| true' because some man page do not exist for several binaries/links
    install -m 644 ../../man/man1/${m}.1    "${pkgdir}/usr/share/man/man1/${m}-${_jdkname}.1" 2>/dev/null || true
    install -m 644 ../../man/ja/man1/${m}.1 "${pkgdir}/usr/share/man/ja/man1/${m}-${_jdkname}.1" 2>/dev/null || true
  done
  popd

  # FIXME Should we use Arch's certs?
  # Link JKS keystore from ca-certificates-java
  #rm -f "${pkgdir}${_jvmdir}/jre/lib/security/cacerts"
  #ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}${_jvmdir}/jre/lib/security/cacerts"

  # Install license
  install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgbase}/"
  install -m 644 COPYRIGHT LICENSE README THIRDPARTYLICENSEREADME{,-JAVAFX}.txt \
                 "${pkgdir}/usr/share/licenses/${pkgbase}"
  ln -sf /usr/share/licenses/${pkgbase} "${pkgdir}/usr/share/licenses/${pkgname}"

  # Move config files that were set in _backup_etc from ./lib to /etc
  for file in ${_backup_etc[@]}; do
    _filepkgpath=${_jvmdir}/jre/lib/${file#etc/java-${_java_ver}-oracle/}
    install -D -m 644 "${pkgdir}${_filepkgpath}" "${pkgdir}/${file}"
    ln -sf /${file} "${pkgdir}${_filepkgpath}"
  done

  # FIXME Conflicts with jre8-oracle :(
  #install -d "${pkgdir}/usr/lib/mozilla/plugins/"
  #ln -s ${_jvmdir}/jre/lib/${_JARCH_ALT}/libnpjp2.so "${pkgdir}/usr/lib/mozilla/plugins/"
  rm -rf ${pkgdir}/usr/share/{icons,applications,mime/packages}
}

package_jdk7-oracle() {
  pkgdesc="Oracle Java ${_java_ver} development kit"
  depends=("jre7-oracle=${pkgver}-${pkgrel}")
  optdepends=('visualvm: to get tools for lightweight profiling capabilities'
              'eclipse: to get "Oracle Mission Control" - need Mission Control Eclipse plugins')
  provides=("java-environment=${_java_ver}" "java-environment-oracle=${_java_ver}")
  install=install_jdk${_java_ver}-oracle.sh

  cd "${srcdir}/${_imgdir}"

  # Main files
  install -d -m 755 "${pkgdir}${_jvmdir}"

  cp -a db include lib release "${pkgdir}${_jvmdir}"
  rm -rf "${pkgdir}${_jvmdir}/lib/visualvm"
  # TODO package 'mission control' on its own - and add optional dependency here
  # (warning its a full Eclipse + plugin)
  rm -rf "${pkgdir}${_jvmdir}/lib/missioncontrol"
  # TODO create package 'derby':
  # - should provide all shell scripts in dir 'bin' along with license files
  # - should depend on AUR java-derby
  # … in the meantime:
  find "${pkgdir}${_jvmdir}" -name "*.bat" -delete

  # 'bin' files
  pushd bin

  install -d -m 755 "${pkgdir}${_jvmdir}/bin/"
  # 'java-rmi.cgi' will be handled separately as it should not be in the PATH and has no man page
  for b in $(ls | grep -v -e java-rmi.cgi -e jvisualvm); do
    if [ -e ../jre/bin/${b} ]; then
      # Provide a link of the jre binary in the jdk/bin/ directory
      ln -s ../jre/bin/${b} "${pkgdir}${_jvmdir}/bin/${b}"
    else
      # Copy binary to jdk/bin/
      install -D -m 755 ${b} "${pkgdir}${_jvmdir}/bin/${b}"
      # Copy man page
      install -D -m 644 ../man/man1/${b}.1 "${pkgdir}/usr/share/man/man1/${b}-${_jdkname}.1"       \
        || true 2>/dev/null
      install -D -m 644 ../man/ja/man1/${b}.1 "${pkgdir}/usr/share/man/ja/man1/${b}-${_jdkname}.1" \
        || true 2>/dev/null
    fi
  done
  popd

  # Handling 'java-rmi.cgi' separately
  install -D -m 755 bin/java-rmi.cgi "${pkgdir}${_jvmdir}/bin/java-rmi.cgi"

  # Desktop files.
  # TODO add them when switching to IcedTea
  #install -m 644 "${srcdir}/icedtea-${_icedtea_ver}/jconsole.desktop" \
  #  "${pkgdir}/usr/share/applications"

  # link license
  install -d -m 755 "${pkgdir}/usr/share/licenses/"
  ln -sf /usr/share/licenses/${pkgbase} "${pkgdir}/usr/share/licenses/${pkgname}"
}

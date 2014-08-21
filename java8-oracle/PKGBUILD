# Maintainer: Guillaume ALAUX <guillaume at alaux dot net>
# Contributor: Det
pkgname=('jre8-oracle' 'jdk8-oracle')
#pkgname=('jre8-oracle-headless' 'jre8-oracle' 'jdk8-oracle')
pkgbase=java8-oracle
_java_ver=8
_update=20
_build=26
# FIXME pkgver to match Arch Linux JDK versioning scheme. Watch out for source
pkgver=${_java_ver}.u${_update}
pkgrel=1

arch=('i686' 'x86_64')
if [ "${CARCH}" = 'x86_64' ]; then
  _JARCH=x64
  _JARCH_ALT=amd64
  _sha256sum_jdk='3e717622ae48af5ca7298e7797cb71d4d545238f362741a83e69c097ca055de4'
else
  _JARCH=i586
  _JARCH_ALT=i386
  _sha256sum_jdk='fa013b3fcbb1308040bf0e75bbd6ef7e8396b547cbc8dd79e3cb8153604bfd06'
fi

url='http://www.oracle.com/technetwork/java/index.html'
license=('custom')
source=(http://download.oracle.com/otn-pub/java/jdk/${_java_ver}u${_update}-b${_build}/jdk-${_java_ver}u${_update}-linux-${_JARCH}.tar.gz
        jconsole-8-oracle.desktop
        policytool-8-oracle.desktop)

sha256sums=(${_sha256sum_jdk}
            '822863cab818dc0d5106975f2ad3209e8cbb6f93bd45920ea0488a0fc1c271c6'
            '13a0eab88c2ecdbfc705e972df865c318d1684bdd80c96b460f881dfc52d6316')

makedepends=('curl')
DLAGENTS=('http::/usr/bin/curl -LC - -b "oraclelicense=a" -O')

_jdkname=8-oracle
_jvmdir=/usr/lib/jvm/java-8-oracle
_imgdir="jdk1.8.0_$(printf '%.2d' ${_update})"

package_jre8-oracle() {
  pkgdesc='Oracle Java 8 runtime environment'
  # FIXME jre dependencies
  depends=('java-common' 'desktop-file-utils'
           'hicolor-icon-theme' 'libxrender' 'libxtst' 'shared-mime-info' 'xdg-utils')
  optdepends=('alsa-lib: sound'
              'ttf-dejavu: fonts')
  provides=('java-runtime-headless=8' 'java-runtime=8' 'java-runtime-headless-oracle=8' 'java-runtime-oracle=8')
  _backup_etc=(etc/java-8-oracle/${_JARCH_ALT}/jvm.cfg
               etc/java-8-oracle/${_JARCH_ALT}/server/Xusage.txt
               etc/java-8-oracle/calendars.properties
               etc/java-8-oracle/content-types.properties
               etc/java-8-oracle/flavormap.properties
               etc/java-8-oracle/fontconfig.properties.src
               etc/java-8-oracle/hijrah-config-umalqura.properties
               etc/java-8-oracle/images/cursors/cursors.properties
               etc/java-8-oracle/javafx.properties
               etc/java-8-oracle/jvm.hprof.txt
               etc/java-8-oracle/logging.properties
               etc/java-8-oracle/management/jmxremote.access
               etc/java-8-oracle/management/jmxremote.password.template
               etc/java-8-oracle/management/management.properties
               etc/java-8-oracle/management/snmp.acl.template
               etc/java-8-oracle/net.properties
               etc/java-8-oracle/psfontj2d.properties
               etc/java-8-oracle/psfont.properties.ja
               etc/java-8-oracle/security/java.policy
               etc/java-8-oracle/security/java.security
               etc/java-8-oracle/security/javaws.policy
               etc/java-8-oracle/sound.properties)
  backup=(${_backup_etc[@]})
  install=install_jre8-oracle.sh

  # FIXME try to use vars for this versin number
  cd "${srcdir}/${_imgdir}/jre"

  install -d -m 755 "${pkgdir}${_jvmdir}/jre/"
  cp -ra * "${pkgdir}${_jvmdir}/jre"

  install -d -m 755 ${pkgdir}/usr/share
  # FIXME sed desktop files so that they directly call /usr/lib/jvm/java-8-oracle/jre/bin/*
  mv ${pkgdir}${_jvmdir}/jre/lib/desktop/* ${pkgdir}/usr/share
  rmdir ${pkgdir}${_jvmdir}/jre/lib/desktop
  # Extra desktop entries
  install ${srcdir}/{jconsole,policytool}-8-oracle.desktop ${pkgdir}/usr/share/applications/

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
    install -m 644 ../../man/man1/${m}.1    "${pkgdir}/usr/share/man/man1/${m}-${_jdkname}.1"    \
      || true 2>/dev/null
    install -m 644 ../../man/ja/man1/${m}.1 "${pkgdir}/usr/share/man/ja/man1/${m}-${_jdkname}.1" \
      || true 2>/dev/null
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
    _filepkgpath=${_jvmdir}/jre/lib/${file#etc/java-8-oracle/}
    install -D -m 644 "${pkgdir}${_filepkgpath}" "${pkgdir}/${file}"
    ln -sf /${file} "${pkgdir}${_filepkgpath}"
  done
}

package_jdk8-oracle() {
  pkgdesc='Oracle Java 8 development kit'
  depends=("jre8-oracle=${pkgver}-${pkgrel}")
  optdepends=('visualvm: to get tools for lightweight profiling capabilities'
              'eclipse: to get "Oracle Mission Control" - need Mission Control Eclipse plugins')
  provides=('java-environment=8' 'java-environment-oracle=8')
  install=install_jdk8-oracle.sh

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

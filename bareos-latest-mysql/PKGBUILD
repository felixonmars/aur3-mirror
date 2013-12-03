# Maintainer:  Max Meyer <dev@fedux.org>
#
# Based on the bareos.spec package
# Contributor: Bruno Friedmann (Ioda-Net) and Philipp Storz (dass IT)
# Contributor: Bareos GmbH & Co KG

####
### EXPERIMENTAL FOR NOW ###
###
pkgname=bareos-latest-mysql
_pkgname=bareos
pkgdesc="The Network Backup Solution"
pkgver=13.2.2
pkgrel=1
arch=("i686" "x86_64")
url="http://www.${_pkgname}.org"
license=("AGPL")
conflicts=(
  'bareos-latest-admin'
  'bareos-latest-client'
  'bareos-latest-postgresql'
)
options=(!buildflags !libtool)
makedepends=(
  'acl'
  'fastlzlib'
  'gcc'
  'glibc'
  'gtk2'
  'libcap'
  'libmariadbclient'
  'libstdc++5'
  'lsb-release'
  'lzo2'
  'make'
  'mtx'
  'ncurses'
  'openssl'
  'perl'
  'pkg-config'
  'python2'
  'qt4'
  'readline'
  'tcp_wrappers'
  'termcap'
  'zlib'
)
optdepends=(
  'mariadb: Need for catalog database'
  'libmariadbclient: Need for catalog database'
)
depends=(
  'acl'
  'fastlzlib'
  'glibc'
  'gtk2'
  'libcap'
  'libmariadbclient'
  'libstdc++5'
  'lsb-release'
  'lz4'
  'lzo2'
  'mariadb'
  'mtx'
  'ncurses'
  'openssl'
  'perl'
  'python2'
  'qt4'
  'readline'
  'systemd'
  'tcp_wrappers'
  'termcap'
  'zlib'
)
provides=(
  ${_pkgname}-latest
)
install="${_pkgname}.install"
source=( https://github.com/${_pkgname}/${_pkgname}/archive/Release/${pkgver}.tar.gz
        00-qmake4.patch
        01-systemd-dir.patch
        03-systemd-daemon-files.patch
        logrotate.conf
        )
sha256sums=('389204b1307da76c08d0a332ed41d5c64f0cc496c83a5ae0931f4571217976f6'
            '9297335f269257093be96be88c1047237f124cd6b358b0fee17f6afaad6b5e80'
            '7f057c870ca7c81fc0cae8bbf0966553ff269b2dacd349d5fd734eb48778d0e7'
            '7a7a32f6447dee5594f5a5f4f6f02fef4f9964b937032dc457a672f9bdbd7793'
            '7407b6c3fa7f06049fa654e3c4316bc22bf78085dff88dbfceac37c5712e8fe1'
            )
_script_dir=/usr/lib/${_pkgname}/scripts
_working_dir=/var/cache/${_pkgname}/working

prepare() {
    cd ${srcdir}/${_pkgname}-Release-${pkgver}
    patch -Np3 -i ${srcdir}/00-qmake4.patch
    patch -Nu platforms/systemd/Makefile.in ${srcdir}/01-systemd-dir.patch
    patch -Np1 -i ${srcdir}/03-systemd-daemon-files.patch
    sed -i "s/python-config/python2-config/g" configure
}

build() {
  cd ${srcdir}/${_pkgname}-Release-${pkgver}

  local _prefix='/usr'
  local _sbin_dir='/usr/bin'
  local _sbin_perms=0755
  local _sysconf_dir="/etc/${_pkgname}"
  local _archive_dir="/var/cache/${_pkgname}/archive"
  local _plugin_dir=/usr/lib/${_pkgname}/plugins
  local _man_dir=/usr/share/man
  local _log_dir=/var/log/$_pkgname
  local _doc_dir="/usr/share/doc/${_pkgname}"
  local _pid_dir=/run/$_pkgname
  local _bsr_dir=/var/cache/${_pkgname}/working
  local _subsys_dir=/run/lock
  local _daemon_user=${_pkgname}
  local _daemon_group=${_pkgname}
  local _director_daemon_user=${_daemon_user}
  local _director_daemon_group=${_daemon_group}
  local _storage_daemon_user=${_daemon_user}
  local _storage_daemon_group=${_daemon_group}
  local _file_daemon_user=root
  local _file_daemon_group=root
  local _systemd_dir=/usr/lib/systemd/system

  ./configure \
    --with-mysql \
    --prefix=${_prefix}\
    --sbindir=${_sbin_dir} \
    --mandir=${_man_dir} \
    --with-sbin-perm=${_sbin_perms} \
    --docdir=${_doc_dir} \
    --disable-conio \
    --enable-acl \
    --enable-bat \
    --enable-batch-insert \
    --enable-build-dird \
    --enable-build-stored \
    --enable-traymonitor \
    --enable-dynamic-cats-backends \
    --enable-includes \
    --enable-ipv6 \
    --enable-ndmp \
    --enable-readline \
    --enable-scsi-crypto \
    --enable-smartalloc \
    --enable-xattr \
    --with-tcp-wrappers \
    --sysconfdir=${_sysconf_dir} \
    --with-archivedir=${_archive_dir} \
    --with-bsrdir=${_bsr_dir} \
    --with-dir-user=${_director_daemon_user} \
    --with-dir-group=${_director_daemon_group} \
    --with-fastlz \
    --with-fd-user=${_file_daemon_user}\
    --with-fd-group=${_file_daemon_group}\
    --with-openssl \
    --with-pid-dir=${_pid_dir} \
    --with-python \
    --with-scriptdir=${_script_dir} \
    --with-sd-group=${_storage_daemon_group} \
    --with-sd-user=$storage_daemon_user \
    --with-subsys-dir=${_subsys_dir} \
    --with-systemd=${_systemd_dir} \
    --with-working-dir=${_working_dir} \
    --with-logdir=${_log_dir} \
    --with-lzo \
    --with-dir-password="XXX_REPLACE_WITH_DIRECTOR_PASSWORD_XXX" \
    --with-fd-password="XXX_REPLACE_WITH_CLIENT_PASSWORD_XXX" \
    --with-sd-password="XXX_REPLACE_WITH_STORAGE_PASSWORD_XXX" \
    --with-mon-dir-password="XXX_REPLACE_WITH_DIRECTOR_MONITOR_PASSWORD_XXX" \
    --with-mon-fd-password="XXX_REPLACE_WITH_CLIENT_MONITOR_PASSWORD_XXX" \
    --with-mon-sd-password="XXX_REPLACE_WITH_STORAGE_MONITOR_PASSWORD_XXX" \
    --with-basename="XXX_REPLACE_WITH_LOCAL_HOSTNAME_XXX" \
    --with-hostname="XXX_REPLACE_WITH_LOCAL_HOSTNAME_XXX"

  make
}

package() {
  cd ${srcdir}/${_pkgname}-Release-${pkgver}

  make DESTDIR=${pkgdir} DISTNAME='systemd' install

  install -d 755 ${pkgdir}/usr/share/applications
  install -d 755 ${pkgdir}/usr/share/pixmaps
  install -d 755 ${pkgdir}/${_working_dir}

  for file in  \
    ${_script_dir}/${_pkgname} \
    ${_script_dir}/${_pkgname}_config \
    ${_script_dir}/btraceback.dbx \
    ${_script_dir}/btraceback.mdb \
    ${_script_dir}/${_pkgname}-ctl-funcs \
    ${_script_dir}/${_pkgname}-ctl-dir \
    ${_script_dir}/${_pkgname}-ctl-fd \
    ${_script_dir}/${_pkgname}-ctl-sd \
    ${_sbin_dir}/${_pkgname}
  do
    rm -f "${pkgdir}/$file"
  done

  ## Permissions
  # executables
  chmod -R 0755 ${pkgdir}/usr/bin

  # scripts
  chmod 0755 ${pkgdir}/usr/lib/${_pkgname}
  chmod 0755 ${pkgdir}/usr/lib/${_pkgname}/scripts/*

  #configs
  chown root:root  /etc/${PKGNAME}
  chmod 0755 ${pkgdir}/etc/${_pkgname}
  chmod 0740 ${pkgdir}/etc/${_pkgname}/*.conf

  #logging
  chmod 0775 ${pkgdir}/var/log/${_pkgname}/

  #cache
  chmod -R 0775 ${pkgdir}/var/cache/${_pkgname}/

  ## Logs
  install -D -m644 ${srcdir}/logrotate.conf ${pkgdir}/etc/logrotate.d/${_pkgname}

  mkdir -p ${pkgdir}/etc/default/
  touch    ${pkgdir}/etc/default/${_pkgname}-fd
  touch    ${pkgdir}/etc/default/${_pkgname}-sd
  touch    ${pkgdir}/etc/default/${_pkgname}-dir

  chmod 0644 ${pkgkdir}/usr/lib/*

}

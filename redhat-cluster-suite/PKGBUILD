# Maintainer: Eric Renfro <erenfro@gmail.com>

pkgname=redhat-cluster-suite
pkgver=3.1.93
pkgrel=0
pkgdesc="A collection of cluster utilities developed by Redhat"
arch=('i686' 'x86_64')
url="http://sources.redhat.com/cluster/wiki"
license=('BSD')
#depends=('corosync>=2.0.0' 'openais>=1.1.4' 'linux>=2.6.31' 
#         'nss>=3' 'ncurses' 'openssl' 'slang' 'nspr>=4' 'libvirt'
#         'libldap' 'libxslt' 'python' 'python-pexpect' 'curl'
#         'linux-headers>=2.6.31' )
depends=('corosync1' 'linux>=2.6.31' 
         'nss>=3' 'ncurses' 'openssl' 'slang' 'nspr>=4' 'libvirt'
         'libldap' 'libxslt' 'python' 'python2-pexpect' 'curl'
         'linux-headers>=2.6.31' 'openais>=1.1.4')
source=("https://fedorahosted.org/releases/c/l/cluster/cluster-${pkgver}.tar.bz2")
md5sums=('dbe3e6b89c5d7914387e1d65c60e5945')
 
build() {
  cd "${srcdir}/cluster-${pkgver}"
  ./configure --prefix=/usr                     \
	      --kernel_src=/usr/src/linux-`uname -r` \
              --ncursesincdir=/usr/include      \
              --ncurseslibdir=/usr/lib          \
              --slangincdir=/usr/include        \
              --slanglibdir=/usr/lib            \
              --corosyncincdir=/usr/include     \
              --corosynclibdir=/usr/lib         \
              --openaisincdir=/usr/include      \
              --openaislibdir=/usr/lib          \
              --corosyncbin=/usr/sbin/corosync  \
              --zlibincdir=/usr/include         \
              --zliblibdir=/usr/lib             \
              --ldapincdir=/usr/include         \
              --ldaplibdir=/usr/lib
              #--fence_agents=all
              
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
  rm -r "${pkgdir}/etc/init.d" || return 1
}


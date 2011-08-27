# Maintainer: Jakob Nixdorf <flocke [swirly thing] user-helfen-usern [dot] de>

pkgname=lsd-svn
pkgver=22
pkgrel=1
pkgdesc="A shell script to download files from one-click hosting sites"
url="http://l-s-d.tk"
license=(GPL3)
arch=(x86_64 i686)
depends=('findutils' 'grep' 'sed' 'wget' 'curl' 'bash')
makedepends=('subversion')
optdepends=('pycrypto: RSDF and CCF support'
	    'openssl: share-online.biz support'
	    'wine: CCF support'
	    'imagemagick: captcha support')
backup=('etc/lsd')
install=lsd.install
source=()
md5sums=()

_svntrunk=http://subversion.assembla.com/svn/lsd_0
_svnmod=lsd

build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf $_svnmod-build
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  # Edit Config File
  sed -i -e 's/DOWNDIR=\"\${MAINDIR}\/downloads\"/DOWNDIR=\"\${HOME}\/downloads\"/g' config || return 1

  # Edit Main Script
  sed -i -e 's#MAINDIR="$(dirname $(readlink -f $(which $0)) | sed -e '\''s/\\/bin//g;'\'')"#MAINDIR="/usr/share/lsd"#g' bin/lsd || return 1
  sed -i -e 's/TMPDIR=\"\${MAINDIR}\/tmp\"/TMPDIR=\"\/tmp\"/g' bin/lsd || return 1
  sed -i -e 's/LOGDIR=\"\${MAINDIR}\/log\"/LOGDIR=\"\${HOME}\/.lsd\"/g' bin/lsd || return 1
  sed -i -e 's/source \${MAINDIR}\/config/source \/etc\/lsd/g' bin/lsd || return 1
  sed -i -e '/source \/etc\/lsd/a \\nif [ ! -d \${DOWNDIR} ]; then\n  mkdir -p \${DOWNDIR}\n  echo \"Missing dir \${DOWNDIR} created\"\nfi\nif [ ! -d \${LOGDIR} ]; then\n  mkdir -p \${LOGDIR}\n  echo \"Missing dir \${LOGDIR} created\"\nfi\n' bin/lsd || return 1

  mkdir -p ${pkgdir}/usr/share/lsd/plugins/container
  mkdir -p ${pkgdir}/etc
  mkdir -p ${pkgdir}/usr/bin

  install -m 755 bin/lsd ${pkgdir}/usr/bin/lsd
  install -m 644 config ${pkgdir}/etc/lsd

  for file in plugins/* ; do
    if [ -f $file ]; then
      install -m 755 $file ${pkgdir}/usr/share/lsd/plugins/;
    fi
  done

  for file in plugins/container/* ; do
    install -m 755 $file ${pkgdir}/usr/share/lsd/plugins/container/
  done
}

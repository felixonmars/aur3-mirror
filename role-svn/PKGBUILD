# Maintainer: Gordin <9ordin at gmail dot com>
pkgname=role-svn
pkgver=2790
pkgrel=1
_ver=m7
pkgdesc="Responsive Open Learning Environments - svn trunk"
arch=('any')
url="http://sourceforge.net/projects/role-project/"
license=('Apache' 'BSD')
depends=('java-environment' 'bash')
conflicts=('role')
provides=('role')
makedepends=('maven2')
install='role.install'
_role='opt/role'

source=('role.init')
sha256sums=('e91c21f89e41263bb197b0248932f290b8871512fac34385da35f541d01a7365')

_svntrunk=https://role-project.svn.sourceforge.net/svnroot/role-project/trunk
_svnmod=role-sdk

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD HERE
  #
  mvn package
}

package() {
  tar -C ${srcdir} -xzf $srcdir/$_svnmod-build/assembly/target/role-${_ver}-sdk.tar.gz
  cd ${srcdir}/role-${_ver}-sdk

  install -d ${pkgdir}/${_role}
  install -d ${pkgdir}/usr/bin

  cd ${srcdir}/role-${_ver}-sdk
  mv * ${pkgdir}/${_role}

  cd ${pkgdir}/${_role}
  rm bin/start.cmd
  chmod +x bin/start.sh
  ln -sf /${_role}/bin/start.sh ${pkgdir}/usr/bin/role
  sed -i "s|\.\.|/${_role}|g" bin/start.sh
  sed -i "2imkdir -p ~/.config/role" bin/start.sh
  sed -i "3icd ~/.config/role" bin/start.sh

  install -D -m755 "${srcdir}/role.init" "${pkgdir}/etc/rc.d/role"
}


# Maintainer: Gordin <9ordin at googlemail dot com>
pkgname=role-git
pkgver=10.1.0.rv8.g86c3bbf
_pkgver=m10
pkgrel=1
pkgdesc="Responsive Open Learning Environments"
arch=('any')
url="http://sourceforge.net/projects/role-project/"
license=('Apache' 'BSD')
makedepends=('git')
depends=('java-environment' 'bash')
install='role.install'
backup=("opt/role/webapps/role-uu-prototype/script/config.js"
        "opt/role/bin/start.sh")
provides=('role')
conflicts=('role')
_role='opt/role'
repo="ROLE-SDK"

source=("git+http://github.com/Gordin/ROLE-SDK.git#branch=OpenIDConnect"
        "role.init")
sha256sums=('SKIP'
            'c7c9244695f017a0a83ce1183333292dfc2a4309d4cdce8fe11d9bf9eaf5bfc9')

pkgver() {
  cd "$srcdir/$repo"
  git describe --tags --long | sed -E 's/([^-]+-g)/rv\1/;s/-/./g;s/^v//g'
}

build()
{
   cd "$srcdir/$repo"
   mvn clean package
   mkdir "$srcdir/tmp_unpack"
   cd "$srcdir/tmp_unpack"
   tar -xf "$srcdir/$repo/assembly/target/role-$_pkgver-sdk.tar.gz"
}

package()
{
   cd "$srcdir/$repo"
   install -d ${pkgdir}/${_role}
   install -d ${pkgdir}/usr/bin

   cd ${srcdir}/tmp_unpack/role-$_pkgver-sdk
   cp * ${pkgdir}/${_role} -r

   cd ${pkgdir}/${_role}
   rm bin/start.cmd
   chmod +x bin/start.sh
   ln -sf /${_role}/bin/start.sh ${pkgdir}/usr/bin/role
   sed -i "s|\.\.|/${_role}|g" bin/start.sh
   sed -i "2imkdir -p /${_role}/db" bin/start.sh
   sed -i "3icd /${_role}/db" bin/start.sh

   install -dm775 db

   install -Dm755 "${srcdir}/role.init" "${pkgdir}/etc/rc.d/role"
}


# Maintainer: Gordin <9ordin at googlemail dot com>
pkgname=role
pkgver=m5
pkgrel=1
pkgdesc="Responsive Open Learning Environments"
arch=('any')
url="http://sourceforge.net/projects/role-project/"
license=('Apache' 'BSD')
depends=('java-environment' 'bash')
install='role.install'
_role='opt/role'

source=("http://downloads.sourceforge.net/project/role-project/role-${pkgver}-sdk/role-${pkgver}-sdk.tar.gz"
        "role.init")
sha256sums=('219dc33789302b373d75ab1a050f19a0d2bfe370d81fc97b94d19903a6374e7a'
            'c7c9244695f017a0a83ce1183333292dfc2a4309d4cdce8fe11d9bf9eaf5bfc9')

build() 
{
   cd ${srcdir}/role-$pkgver-sdk
}

package()
{
   install -d ${pkgdir}/${_role}
   install -d ${pkgdir}/usr/bin

   cd ${srcdir}/role-$pkgver-sdk
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


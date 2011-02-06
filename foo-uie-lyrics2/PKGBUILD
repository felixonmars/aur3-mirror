# Maintainer: Florian Léger <florian6 dot leger at laposte dot net>
pkgname=foo-uie-lyrics2
pkgver=0.4.6.15
pkgrel=3
pkgdesc="A lyrics display plugin for foobar2000."
arch=(any)
url="http://www.hydrogenaudio.org/forums/index.php?showtopic=76968"
license=('LGPL')
depends=(foobar2000)
source=("http://chef-koch.googlecode.com/svn/trunk/Foobar2000/components/${pkgname//-/_}.dll")
md5sums=('f1169a2a9b37569cda3103187fe57c7d')

package() {
  install -D -m644 "${srcdir}/${pkgname//-/_}.dll" "${pkgdir}/usr/share/foobar2000/components/${pkgname//-/_}.dll" || return 1
}

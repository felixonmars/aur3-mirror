# Maintainer: Ng Oon-Ee <n g  o o n  e e AT g m a i l DOT c o m>
pkgname=realstudio_feedback
pkgver=2012r1
pkgrel=1
pkgdesc="Feedback system for Real Studio"
arch=('i686' 'x86_64')
url="http://www.realsoftware.com"
license=('custom')
depends=('realstudio')
source=(http://realsoftware.cachefly.net/REALStudio${pkgver}/RealStudio${pkgver}.tgz realstudio.desktop)
source=(Feedback_"${pkgver}"::http://feedback.realsoftware.com/newest/public/Feedback.rpm)
md5sums=('21390f1f28c6c85b6bfaeb85527fe5bf')

package() {
	install -dv -m755 ${pkgdir}/opt/realsoftware/feedback
  cp -a ${srcdir}/opt/realsoftware/feedback/* ${pkgdir}/opt/realsoftware/feedback
}

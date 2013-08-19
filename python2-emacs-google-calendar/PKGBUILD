# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Thomas Etcheverria <tetcheve@gmail.com>
pkgname=python2-emacs-google-calendar
pkgver=0.0.3
pkgrel=1
pkgdesc="Python2 part to use Google calendar inside emacs"
arch=('any')
url="http://code.google.com/p/emacs-google/"
license=('GPL')
install=python2-emacs-google.install
depends=("python2" "python2-gdata")
source=("http://emacs-google.googlecode.com/files/google-emacs-0.0.3.tgz")
md5sums=('16ea639f8163d34d6877b8aeb69abecc')

package() {
  cd ${srcdir}/google/code
  mkdir -p ${pkgdir}/usr/lib/python2/site-packages/emacs-google

  install -Dm644 deleteEvent.py ${pkgdir}/usr/lib/python2/site-packages/emacs-google/deleteEvent.py
  install -Dm644 insertEvent.py ${pkgdir}/usr/lib/python2/site-packages/emacs-google/insertEvent.py
  install -Dm644 insertContact.py ${pkgdir}/usr/lib/python2/site-packages/emacs-google/insertContact.py
  install -Dm644 insertQuickEvent.py ${pkgdir}/usr/lib/python2/site-packages/emacs-google/insertQuickEvent.py
  install -Dm644 syncContacts.py ${pkgdir}/usr/lib/python2/site-packages/emacs-google/syncContacts.py
}

# vim:set ts=2 sw=2 et:

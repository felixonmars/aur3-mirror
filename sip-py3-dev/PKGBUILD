# SIP Snapshot: Installer: Arch
# Contributor: Andrey Antoukh <andsux@gmail.com>

pkgname=sip-py3-dev
realname=sip
pkgver=4.8
pkgdate=20090321
pkgrel=1
pkgdesc="A tool that makes it easy to create Python 3.0 bindings for C and C++ libraries.  This is the latest development snapshot."
arch=('any')
url="http://www.riverbankcomputing.com/software/sip/"
license=('custom:"sip"')
provides=('sip=4.8')
depends=('python>=2.6')
conflicts=('sip' 'sip4')
replaces=('sip4')
options=(!emptydirs)

source=(http://riverbankcomputing.com/static/Downloads/${realname}4/${realname}-${pkgver}-snapshot-${pkgdate}.tar.gz)
md5sums=('8a3784d89145e17465874d23f3de1171')

build() {
  cd ${srcdir}/${realname}-${pkgver}-snapshot-${pkgdate}

  python3.0 configure.py -b /usr/bin \
    -d /usr/lib/python3.0/site-packages \
    -e /usr/include/python3.0 \
    -v /usr/share/${realname} || return 1

  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  chmod 644 ${pkgdir}/usr/lib/python3.0/site-packages/${realname}distutils.py
  install -m 644 -D LICENSE  ${pkgdir}/usr/share/licenses/${realname}/LICENSE
}

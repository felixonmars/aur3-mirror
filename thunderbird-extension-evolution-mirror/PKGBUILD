# Contributor: twa022 <twa022 at gmail dot com>

pkgname=thunderbird-extension-evolution-mirror
pkgver=0.2.2
pkgrel=1
pkgdesc="Mirrors calendars to Evolution Database Server to allow them to be viewed through the gnome clock applet"
arch=('any')
url="https://addons.mozilla.org/af/thunderbird/addon/evolution-mirror/"
license=('MPL1.1')
depends=('thunderbird<3.2a1pre' 'python-evolution')
source=("https://static.addons.mozilla.net/_files/_attachments/9656/evolution_mirror-${pkgver}-sb+tb-linux.xpi")
noextract=(evolution_mirror-${pkgver}-sb+tb-linux.xpi)

_id='{531b5d09-9f8e-452b-8681-2fc03c9c150e}'

build() {
  cd "$srcdir"
  mkdir -p "$pkgdir"/usr/lib/thunderbird-3.1/extensions/${_id}
  unzip evolution_mirror-${pkgver}-sb+tb-linux.xpi -d "$pkgdir"/usr/lib/thunderbird-3.1/extensions/${_id}
  sed -i 's:/usr/bin/env python:&2:' "$pkgdir"/usr/lib/thunderbird-3.1/extensions/${_id}/chrome/content/*py
}


md5sums=('430ab1740c40a84ef147fb7c270fc45e')

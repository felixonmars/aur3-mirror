pkgname=python2-mne-git
pkgver=v0.2.r3907.g401b0cd
pkgrel=2
pkgdesc="Magnetoencephalography (MEG) and Electroencephalography (EEG) in Python"
arch=('i686' 'x86_64')
url="https://github.com/mne-tools/mne-python"
license=('BSD')
depends=('python2' 'python2-numpy' 'python2-scipy')
makedepends=("git")
provides=("python2-mne")
source=("$pkgname"::'git://github.com/mne-tools/mne-python.git')
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  mv bin/mne bin/mne2
  sed -i 's/env python/env python2/g' bin/mne2
  sed -i 's/bin\/mne/bin\/mne2/g' setup.py
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

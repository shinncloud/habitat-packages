pkg_name="docbook-xsl"
pkg_origin="shinncloud"
pkg_version="1.79.1"
pkg_maintainer="Andy Shinn <andys@andyshinn.as>"
pkg_license=("Apache-2.0")
pkg_source="https://sourceforge.net/projects/docbook/files/${pkg_name}/${pkg_version}/${pkg_name}-${pkg_version}.tar.bz2/download"
pkg_filename="${pkg_name}-${pkg_version}.tar.bz2"
pkg_shasum="725f452e12b296956e8bfb876ccece71eeecdd14b94f667f3ed9091761a4a968"

do_build() {
  return 0
}

do_install() {
  install -v -m755 -d "${pkg_prefix}/share/xml/docbook/xsl-stylesheets"

  cp -v -R VERSION assembly common eclipse epub epub3 extensions fo      \
         highlighting html htmlhelp images javahelp lib manpages params  \
         profiling roundtrip slides template tests tools webhelp website \
         xhtml xhtml-1_1 xhtml5                                          \
    "${pkg_prefix}/share/xml/docbook/xsl-stylesheets"

  ln -s VERSION "${pkg_prefix}/share/xml/docbook/xsl-stylesheets/VERSION.xsl"

  install -v -m644 -D README \
                      "${pkg_prefix}/share/doc/docbook-xsl/README.txt"
  install -v -m644    RELEASE-NOTES* NEWS* \
                      "${pkg_prefix}/share/doc/docbook-xsl"
}
